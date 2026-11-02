# BoS OS — Quickstart

Get from zero to your first Bootstrap session.

---

## Before you start

You need:
- An AI that can read a folder of files, such as Claude or ChatGPT
- A folder on your computer inside Dropbox, Google Drive, or similar cloud sync

If you're missing either, sort it first. Everything else depends on them. The [README](README.md#getting-started) has a table of routes for different AI tools.

---

## Step 1. Download the skill file

Go to the [latest release](https://github.com/BoSMark/BoS_OS_Start/releases/latest) and download `agent-os-bootstrap.skill`.

This is a single file. **Do not unzip it.** Upload it as-is in Step 3.

---

## Step 2. Give your AI access to your folder

Make an empty folder inside Dropbox, Google Drive or similar. Then give your AI access to it. The screens differ between tools and change often. If you cannot find the option, ask your AI "How do I connect you to a folder on my computer?" and follow what it tells you.

> **Why a synced folder?** A folder that isn't cloud-synced isn't backed up, and won't be reachable from another machine.

---

## Step 3. Add the skill

Where your AI takes skill files, upload `agent-os-bootstrap.skill` as downloaded. Where it does not, open `agent-os-bootstrap/SKILL.md` in the repo and paste its contents as your first message.

---

## Step 4. Run Bootstrap

Start a chat in the place where your AI can see your folder. Then type this exactly:

> **Bootstrap my BoS OS**

It will ask for your company name, then build your BoS OS draft from there.

> **Nothing happened?** If the reply is generic and doesn't ask for your company name, the skill didn't install, or your AI can't see your folder. Go back to Step 2 and Step 3.

---

## That's it — for now

When Bootstrap finishes, read the summary Bootstrap gives you in the conversation. It tells you exactly what was created and what to do next.

Run Workshop next to deepen what Bootstrap produced. Once your strategy layer and role definitions are solid, come back and install the Run skill to start operating missions and spec your agents.

---

## Installing the Run skill (after Bootstrap and Workshop)

When you're ready to run missions:

1. Go to the [latest release](https://github.com/BoSMark/BoS_OS_Start/releases/latest) and download `agent-os-run.skill`
2. Install it the same way you installed Bootstrap
3. In the same place, type: **Run a mission**. The skill will orient itself to where you are and guide you from there

The Run skill is self-contained. It includes everything it needs — you don't load separate files. It works in three stages: **Mission Shaper** (coaches your rough idea into a measurable Mission Brief) → **Agent Planner** (staffs the mission with a team of agents) → **Delivery Manager** (runs the backlog and drives delivery). The skill knows which stage you're in and picks up from there each session.

The full README has everything else — background, upgrade instructions, troubleshooting. Come back to it when you need it.

---

*[Full README](README.md) · [Troubleshooting](README.md#troubleshooting) · [BoS workshops and community](https://businessofsoftware.org/updates)*

## At the end of Bootstrap

Review the setup summary before it is saved as `BOOTSTRAP_SUMMARY.md`. Check its next actions, owners and completion conditions. Use `01_STATE/session_summary.md` for current work after setup. The learning protocol starts in `01_STATE/memory/README.md` with no invented entries. Existing company folders do not need to be bootstrapped again; ask Bootstrap to compare the folder with the current template and review its proposed additions.
