# BoS OS — Quickstart

Get from zero to your first Bootstrap session in under 10 minutes.

---

## Before you start

You need:
- A Claude Pro subscription
- Cowork mode enabled (desktop app, not browser)
- A folder on your computer inside Dropbox, Google Drive, or similar cloud sync

If you're missing any of these, sort them first. Everything else depends on them.

---

## Step 1 — Download the skill file

Go to the [latest release](https://github.com/BoSMark/BoS_OS_Start/releases/latest) and download `agent-os-bootstrap.skill`.

This is a single file. **Do not unzip it.** Upload it as-is in the next step.

---

## Step 2 — Create a Cowork project

Before installing anything, set up your project:

1. In Cowork, click **Projects** in the left sidebar
2. Click **New project** (top right)
3. Choose **Start from scratch**
4. Give your project a name (e.g. "My Company OS")
5. Leave Instructions blank — Bootstrap will fill this in automatically
6. Under **Choose project location**, click the folder path and change it to a folder inside Dropbox, Google Drive, or similar cloud sync — **don't leave it as the default** (`Documents/Claude/Projects`)
7. Click **Create**

> **Why change the location?** The default folder isn't cloud-synced. If you leave it there, your files won't be backed up and won't be accessible from another machine.

> **Already have a folder set up?** On the previous screen, choose **Use an existing folder** instead of Start from scratch.

---

## Step 3 — Install the skill

In Cowork, click **Customize** in the left sidebar.

![Step 3a: In Cowork, click Customize in the left sidebar](images/step3a_cowork_customize.png)

Then: **Skills** → click the **+** icon (top right of the skills panel) → **Create skill** → **Upload a skill** → select `agent-os-bootstrap.skill`.

![Step 3b: Skills → + → Create skill → Upload a skill](images/step3b_upload_skill.png)

> **Don't click "Browse skills" or "Browse plugins"** — those only show pre-built options and won't let you upload your own file.

---

## Step 4 — Run Bootstrap

In the left sidebar, click your project name (it will be under **Pinned**). Then type this exactly:

> **Bootstrap my company OS**

Claude will ask for your company name, then build your OS draft from there. The whole run takes 20–40 minutes.

> **Nothing happened?** If Claude gives a generic reply instead of asking for your company name, the skill didn't install correctly. Go back to Step 3 and check you used **Upload a skill** (not Browse skills or Browse plugins).

---

## That's it — for now

When Bootstrap finishes, read `BOOTSTRAP_SUMMARY.md` in your project folder. It tells you exactly what was created and what to do next.

Run Workshop next to deepen what Bootstrap produced. Once your strategy layer and agent specs are solid, come back and install the Run skill to start operating missions.

---

## Installing the Run skill (after Bootstrap and Workshop)

When you're ready to run missions:

1. Go to the [latest release](https://github.com/BoSMark/BoS_OS_Start/releases/latest) and download `agent-os-run.skill`
2. Install it the same way: **Customize → Skills → + → Create skill → Upload a skill**
3. In your project, type: **Run a mission** — the skill will orient itself to where you are and guide you from there

The Run skill is self-contained. It includes everything it needs — you don't load separate files. It works in three stages: **Mission Shaper** (coaches your rough idea into a measurable Mission Brief) → **Agent Planner** (staffs the mission with a team of agents) → **Delivery Manager** (runs the backlog and drives delivery). The skill knows which stage you're in and picks up from there each session.

The full README has everything else — background, upgrade instructions, troubleshooting. Come back to it when you need it.

---

*[Full README](README.md) · [Troubleshooting](README.md#troubleshooting) · [BoS workshops and community](https://businessofsoftware.org/updates)*
