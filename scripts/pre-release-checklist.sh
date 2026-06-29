#!/bin/bash

# Pre-Release Checklist for BoS OS GitHub Release — v2
#
# This script validates that a release is ready to push to main.
# Incorporates all safeguards: repository state, versions, structure,
# changelog, and consistency across the three-skill bundle.
#
# Run this BEFORE committing and pushing a version bump.
#
# Usage: bash scripts/pre-release-checklist.sh
#
# Exit codes:
#   0 = all checks passed, safe to push
#   1 = one or more checks failed, do not push

set -o pipefail  # Fail if any command in a pipeline fails

REPO_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$REPO_ROOT"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

CHECKS_PASSED=0
CHECKS_FAILED=0

# Helper functions
check_pass() {
    echo -e "${GREEN}✓${NC} $1"
    ((CHECKS_PASSED++))
}

check_fail() {
    echo -e "${RED}✗${NC} $1"
    ((CHECKS_FAILED++))
}

check_warn() {
    echo -e "${YELLOW}⚠${NC} $1"
}

echo "=========================================="
echo "BoS OS Pre-Release Checklist v2"
echo "=========================================="
echo ""

# ==================== PHASE 0: PERSONALISATION VERIFICATION ====================
echo "=== PHASE 0: PERSONALISATION VERIFICATION ==="
echo ""

# Check 0a: No bare 'the OS' references left in SKILL.md files
# (these should all have been replaced with {{OS_SHORTHAND}} BoS OS)
echo "Checking for unreplaced 'the OS' references in SKILL.md files..."
BARE_OS_HITS=0
for skill_file in agent-os-bootstrap/SKILL.md agent-os-workshop/SKILL.md agent-os-run/SKILL.md; do
    if [ -f "$skill_file" ]; then
        COUNT=$(grep "\bthe OS\b" "$skill_file" 2>/dev/null | grep -v '"the OS"' | wc -l || true)
        if [ "$COUNT" -gt 0 ]; then
            check_fail "$skill_file contains $COUNT bare 'the OS' reference(s) — should be '{{OS_SHORTHAND}} BoS OS'"
            grep -n "\bthe OS\b" "$skill_file" | grep -v '"the OS"'
            BARE_OS_HITS=$((BARE_OS_HITS + COUNT))
        fi
    fi
done
if [ "$BARE_OS_HITS" -eq 0 ]; then
    check_pass "No bare 'the OS' references found in SKILL.md files"
fi

# Check 0b: {{OS_SHORTHAND}} placeholder present in all three SKILL.md files
echo ""
echo "Checking {{OS_SHORTHAND}} placeholder is present..."
for skill_file in agent-os-bootstrap/SKILL.md agent-os-workshop/SKILL.md agent-os-run/SKILL.md; do
    if [ -f "$skill_file" ]; then
        if grep -q "OS_SHORTHAND" "$skill_file"; then
            check_pass "$skill_file contains OS_SHORTHAND placeholder"
        else
            check_fail "$skill_file missing OS_SHORTHAND placeholder — personalisation not applied"
        fi
    fi
done

# ==================== PHASE 1: REPOSITORY STATE ====================
echo ""
echo "=== PHASE 1: REPOSITORY STATE ==="
echo ""

# Check 1: No uncommitted changes
echo "Checking repository state..."
if git diff-index --quiet HEAD --; then
    check_pass "No uncommitted changes"
else
    check_fail "Uncommitted changes detected. Commit or stash before releasing."
    git status
fi

# Check 2: Git is on main branch
echo ""
echo "Checking git branch..."
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$CURRENT_BRANCH" = "main" ]; then
    check_pass "On main branch"
else
    check_fail "Not on main branch (current: $CURRENT_BRANCH)"
fi

# Check 3: Main branch is up to date with origin
echo ""
echo "Checking if main is up to date with origin..."
git fetch origin main >/dev/null 2>&1 || true
LOCAL_COMMIT=$(git rev-parse main)
REMOTE_COMMIT=$(git rev-parse origin/main 2>/dev/null || echo "unknown")
if [ "$LOCAL_COMMIT" = "$REMOTE_COMMIT" ] || [ "$REMOTE_COMMIT" = "unknown" ]; then
    check_pass "Main branch is up to date with origin"
else
    check_fail "Main branch is behind origin. Pull before pushing."
fi

# ==================== PHASE 2: VERSION VALIDATION ====================
echo ""
echo ""
echo "=== PHASE 2: VERSION VALIDATION ==="
echo ""

# Check 4: Version exists in agent-os-run/SKILL.md
echo "Checking version metadata..."
if grep -q "version:" agent-os-run/SKILL.md; then
    VERSION=$(grep "version:" agent-os-run/SKILL.md | head -1 | awk '{print $NF}')
    check_pass "Version found in agent-os-run/SKILL.md: $VERSION"
else
    check_fail "Version not found in agent-os-run/SKILL.md"
    VERSION=""
fi

# Check 5: Version format is valid (X.Y or X.Y.Z — both used in this project)
if [ -n "$VERSION" ] && [[ $VERSION =~ ^[0-9]+\.[0-9]+(\.[0-9]+)?$ ]]; then
    check_pass "Version format is valid: $VERSION"
else
    check_fail "Version format is invalid (expected X.Y or X.Y.Z): $VERSION"
fi

# Check 6: Version is not already released
echo ""
echo "Checking GitHub release history..."
if [ -n "$VERSION" ]; then
    if git tag | grep -q "^v$VERSION$"; then
        check_fail "Version v$VERSION already exists as a git tag. Increment version."
    else
        check_pass "Version v$VERSION is not yet released"
    fi
fi

# ==================== PHASE 3: STRUCTURE CONSISTENCY ====================
echo ""
echo ""
echo "=== PHASE 3: STRUCTURE CONSISTENCY ==="
echo ""

# Check 7: YAML structure consistency
echo "Checking YAML structure across all skills..."
SKILLS=("agent-os-bootstrap/SKILL.md" "agent-os-workshop/SKILL.md" "agent-os-run/SKILL.md")

BOOTSTRAP_INDENT=$(grep "version:" agent-os-bootstrap/SKILL.md | head -1 | sed 's/^\( *\).*/\1/' | wc -c)
WORKSHOP_INDENT=$(grep "version:" agent-os-workshop/SKILL.md | head -1 | sed 's/^\( *\).*/\1/' | wc -c)
RUN_INDENT=$(grep "version:" agent-os-run/SKILL.md | head -1 | sed 's/^\( *\).*/\1/' | wc -c)

if [ "$BOOTSTRAP_INDENT" -eq "$WORKSHOP_INDENT" ] && [ "$WORKSHOP_INDENT" -eq "$RUN_INDENT" ]; then
    check_pass "All version fields have consistent indentation"
else
    check_fail "Version fields have inconsistent indentation (bootstrap: $BOOTSTRAP_INDENT, workshop: $WORKSHOP_INDENT, run: $RUN_INDENT chars)"
fi

# Check 8: Version consistency across all three skills
echo ""
echo "Checking version consistency..."
BOOTSTRAP_VERSION=$(grep "version:" agent-os-bootstrap/SKILL.md | head -1 | awk '{print $NF}')
WORKSHOP_VERSION=$(grep "version:" agent-os-workshop/SKILL.md | head -1 | awk '{print $NF}')
RUN_VERSION=$(grep "version:" agent-os-run/SKILL.md | head -1 | awk '{print $NF}')

VERSION_CONSISTENT=true
if [ "$BOOTSTRAP_VERSION" = "$WORKSHOP_VERSION" ] && [ "$WORKSHOP_VERSION" = "$RUN_VERSION" ]; then
    check_pass "All three skills have matching version: $RUN_VERSION"
else
    check_fail "Version mismatch (bootstrap: $BOOTSTRAP_VERSION, workshop: $WORKSHOP_VERSION, run: $RUN_VERSION)"
    VERSION_CONSISTENT=false
fi

# ==================== PHASE 4: FILE VALIDATION ====================
echo ""
echo ""
echo "=== PHASE 4: FILE VALIDATION ==="
echo ""

# Check 9: README.md exists and is not empty
echo "Checking documentation..."
if [ -f README.md ] && [ -s README.md ]; then
    check_pass "README.md exists and is not empty"
else
    check_fail "README.md is missing or empty"
fi

# Check 9b: README.md contains the release version number
echo ""
echo "Checking README.md mentions release version..."
if [ -n "$VERSION" ]; then
    if grep -q "$VERSION" README.md 2>/dev/null; then
        check_pass "README.md mentions v$VERSION"
    else
        check_fail "README.md does not mention v$VERSION — update the version number in README.md"
    fi
fi

# Check 10: All three SKILL.md files exist
echo ""
echo "Checking skill definitions..."
SKILLS_OK=true
for skill in "${SKILLS[@]}"; do
    if [ -f "$skill" ] && [ -s "$skill" ]; then
        check_pass "$skill exists"
    else
        check_fail "$skill is missing or empty"
        SKILLS_OK=false
    fi
done

# Check 11: Each SKILL.md has a version field
echo ""
echo "Checking individual skill versions..."
for skill in "${SKILLS[@]}"; do
    if grep -q "version:" "$skill"; then
        SKILL_VERSION=$(grep "version:" "$skill" | head -1 | awk '{print $NF}')
        check_pass "$skill version: $SKILL_VERSION"
    else
        check_fail "$skill missing version field"
    fi
done

# Check 12: Verify workflow file exists
echo ""
echo "Checking CI/CD infrastructure..."
if [ -f .github/workflows/release.yml ]; then
    check_pass ".github/workflows/release.yml exists"
else
    check_fail ".github/workflows/release.yml not found"
fi

# ==================== PHASE 5: CHANGELOG ====================
echo ""
echo ""
echo "=== PHASE 5: CHANGELOG ==="
echo ""

# Check 13: CHANGELOG.md exists
if [ ! -f CHANGELOG.md ]; then
    check_fail "CHANGELOG.md not found"
    CHANGELOG_OK=false
elif [ ! -s CHANGELOG.md ]; then
    check_fail "CHANGELOG.md is empty"
    CHANGELOG_OK=false
else
    check_pass "CHANGELOG.md exists and is not empty"
    
    # Check 14: CHANGELOG.md contains entry for current version
    if [ -n "$VERSION" ]; then
        if grep -E "^#+\s*(v)?$VERSION" CHANGELOG.md > /dev/null; then
            check_pass "CHANGELOG.md contains entry for v$VERSION"
            CHANGELOG_OK=true
        else
            check_fail "CHANGELOG.md does not contain entry for v$VERSION"
            CHANGELOG_OK=false
        fi
    fi
fi

# ==================== SUMMARY ====================
echo ""
echo ""
echo "=========================================="
echo "Summary"
echo "=========================================="
echo -e "Passed: ${GREEN}$CHECKS_PASSED${NC}"
echo -e "Failed: ${RED}$CHECKS_FAILED${NC}"
echo ""

if [ $CHECKS_FAILED -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed. Safe to push.${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Review your commit message clarity"
    echo "  2. Run: git push origin main"
    echo "  3. Watch GitHub Actions: https://github.com/BoSMark/BoS_OS_Start/actions"
    echo "  4. Verify release at: https://github.com/BoSMark/BoS_OS_Start/releases"
    echo ""
    echo "Reference: RELEASE_PROCEDURES.md"
    exit 0
else
    echo -e "${RED}✗ Checks failed. Do not push until issues are resolved.${NC}"
    echo ""
    echo "Failed checks above. Fix each issue, then run this checklist again."
    exit 1
fi
