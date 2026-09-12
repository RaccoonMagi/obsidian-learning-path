# Setup Guide

Complete setup takes approximately 15–20 minutes.

---

## Prerequisites

| Tool | Required | Install |
|---|---|---|
| [Obsidian](https://obsidian.md) | Yes | Download from obsidian.md |
| [Claude Code CLI](https://claude.ai/code) | Yes | `npm install -g @anthropic-ai/claude-code` |
| Git | Yes | `brew install git` (macOS) |
| bash | Yes | Pre-installed on macOS/Linux |

---

## Step 1 — Clone the Repository

```bash
git clone https://github.com/AndresJaramillo/obsidian-learning-path
cd obsidian-learning-path
```

---

## Step 2 — Identify Your Vault Root

Your Obsidian vault is the folder you opened in Obsidian. It contains a `.obsidian/` directory.

```bash
# Find it if you're unsure
find ~/Documents -name ".obsidian" -type d 2>/dev/null
```

Note the path — you'll use it in the next step.

---

## Step 3 — Run the Setup Script

```bash
bash scripts/setup.sh /path/to/your/obsidian-vault
```

The script will:
- Create the folder structure inside your vault under `Learning/<SUBJECT>/`
- Copy all templates into `Learning/Templates/`
- Copy the Dashboard into `Learning/<SUBJECT>/Dashboard.md`
- Install Templater, Dataview, and Obsidian Spaced Repetition plugins into `.obsidian/plugins/`
- Copy `.claude/commands/` to your vault's learning directory
- Write a starter `CLAUDE.md` to the learning directory

You will be prompted for:
1. Your subject name (e.g., `Rust`, `Machine Learning`, `Linear Algebra`)
2. Your vault's learning folder name (default: `Learning`)

---

## Step 4 — Configure CLAUDE.md

Open `<vault>/Learning/<SUBJECT>/CLAUDE.md` and fill in the marked sections:

```
[SUBJECT]       → what you are learning (e.g., "Rust programming")
[GOAL]          → what you want to be able to do when done
[RESOURCES]     → your ordered list of books, courses, videos
```

This file is what Claude reads at the start of every session. The more specific you are, the more precise Claude's help will be.

Example for a mathematics learner:

```markdown
## The Goal
Build rigorous understanding of linear algebra from first principles,
sufficient to implement and understand ML algorithms from scratch.

## Resources (in order)
1. 3Blue1Brown — Essence of Linear Algebra (YouTube)
2. Gilbert Strang — Introduction to Linear Algebra (book)
3. fast.ai — Practical Deep Learning (course)
```

---

## Step 5 — Enable Plugins in Obsidian

1. Open Obsidian and open your vault
2. Go to **Settings** (gear icon) → **Community Plugins**
3. Turn off **Restricted Mode** if prompted
4. Enable each plugin:
   - **Templater**
   - **Dataview**
   - **Obsidian Spaced Repetition**

> The plugins are already installed in `.obsidian/plugins/` by the setup script — you just need to toggle them on.

---

## Step 6 — Configure Templater

1. **Settings** → **Templater**
2. Set **Template folder location** → `Learning/Templates`
3. Enable **Trigger Templater on new file creation** (optional but recommended)

---

## Step 7 — Open the Dashboard

Navigate to `Learning/<SUBJECT>/Dashboard.md` in Obsidian.

The Dataview tables will be empty until you create notes — that's expected. This is your home base for every future session.

---

## Step 8 — Start Claude Code in Your Vault

```bash
cd /path/to/your/obsidian-vault/Learning/<SUBJECT>
claude
```

Claude will automatically read `CLAUDE.md` and have full context about your system and goals.

Try your first command:

```
/study-session
```

---

## Folder Structure After Setup

```
<vault>/
├── .obsidian/
│   └── plugins/
│       ├── templater-obsidian/
│       ├── dataview/
│       └── obsidian-spaced-repetition/
│
└── Learning/
    ├── Templates/
    │   ├── Cornell Note.md
    │   ├── Feynman Explanation.md
    │   ├── Concept Note.md
    │   ├── Flashcard.md
    │   ├── Weekly Review.md
    │   └── Project Post-Mortem.md
    │
    └── <SUBJECT>/
        ├── CLAUDE.md            ← Claude's context file
        ├── Dashboard.md         ← your home base
        │
        ├── .claude/
        │   └── commands/        ← Claude slash commands
        │
        ├── Concept Notes/       ← one file per concept
        ├── Resources/           ← one folder per resource in roadmap
        ├── Feynman/             ← plain-language explanations
        ├── Flashcards/          ← SRS card files
        └── Weekly Reviews/      ← Sunday review notes
```

---

## Updating the System

When this repository is updated with new templates or commands:

```bash
cd obsidian-learning-path
git pull
bash scripts/setup.sh /path/to/your/vault --update
```

The `--update` flag overwrites templates and commands without touching your notes.

---

## Troubleshooting

**Dataview tables show "No results"**
Normal until you create notes with the correct `type` frontmatter. Use templates from the start.

**Templater not inserting dates**
Make sure the template folder path in Templater settings matches exactly: `Learning/Templates`

**Claude doesn't seem to have context**
Make sure you're running `claude` from inside the `Learning/<SUBJECT>/` directory, not the vault root. CLAUDE.md must be in the current working directory or a parent.

**Plugin not loading**
Open Obsidian → Settings → Community Plugins → verify the plugin appears in the list. If not, re-run `setup.sh`.

**Spaced Repetition cards not showing**
Add `#review` to your flashcard file's tags, or add `sr-due` frontmatter. See `templates/Flashcard.md`.
