# Obsidian Learning Path System

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![Obsidian](https://img.shields.io/badge/Obsidian-Compatible-7C3AED?logo=obsidian&logoColor=white)](https://obsidian.md)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Integrated-D97706?logo=anthropic&logoColor=white)](https://claude.ai/code)

> A structured, Claude-integrated knowledge system for accelerating deep learning in any technical domain.
> Clone it. Configure it. Learn faster and retain more.

---

## What This Is

This repository is a complete, ready-to-deploy learning infrastructure built on top of [Obsidian](https://obsidian.md). It wires together proven cognitive science techniques — active recall, spaced repetition, the Feynman Technique, and Cornell note-taking — with a set of Claude AI slash commands that act as a live study partner inside your vault.

The result is a system where every study session produces durable knowledge, not just the feeling of learning.

This is not a collection of note templates. It is an opinionated framework built around one belief:

> **Passive consumption produces almost zero retention. Every component of this system exists to create productive struggle.**

---

## Who This Is For

Anyone learning a technical subject who wants to:
- Build deep understanding, not surface familiarity
- Retain what they study weeks and months later
- Use AI as a precision tool, not a crutch
- Have a system that adapts to any domain — programming, mathematics, engineering, medicine, law

Originally built for a C programming and computer science curriculum. Generalizes to any structured learning path.

---

## The Problem This Solves

Most learners follow a passive loop:

```
Read → Highlight → Re-read → Feel confident → Forget within a week
```

This loop has three fatal flaws:

1. **Fluency illusion** — reading something smoothly feels like understanding it. It isn't.
2. **No retrieval practice** — the brain builds memory through retrieval, not exposure. Highlighting never retrieves anything.
3. **No spacing** — cramming produces short-term recall. Spaced review across days and weeks builds long-term memory.

This system replaces the passive loop with an active one:

```
Study unit → Explain from memory → Find gaps → Re-study gaps → Drill with spaced repetition → Weekly synthesis
```

---

## System Components

### 1. Six Note Types

Every piece of knowledge gets captured in exactly one of six structured formats. The format determines what cognitive work you do with the material.

| Note Type | When to Use | Core Cognitive Work |
|---|---|---|
| **Cornell Note** | During/after chapters and videos | Recall → question generation → synthesis |
| **Feynman Explanation** | After any concept | Plain-language explanation → gap finding |
| **Concept Note** | Every new technical syntax or pattern | Predict → run → break → explain |
| **Flashcard** | Any fact worth long-term retention | Spaced retrieval |
| **Weekly Review** | Every Sunday | Synthesis → gap audit → planning |
| **Project Post-Mortem** | After every hands-on project | Mistake analysis → mental model update |

### 2. Three Obsidian Plugins

| Plugin | Purpose |
|---|---|
| **Templater** | Inserts dynamic templates (date, title, cursor) with a single command |
| **Dataview** | Powers the Dashboard — live queries across all your notes |
| **Spaced Repetition** | Surfaces flashcards on an optimal review schedule |

### 3. Claude Integration

A `CLAUDE.md` file gives Claude complete context about your learning system, subject, and goals — automatically, in every session. Seven slash commands let you trigger structured study workflows without writing a prompt from scratch.

| Command | Purpose |
|---|---|
| `/study-session` | Plan a focused session based on available time |
| `/feynman` | Run the full Feynman loop on any concept |
| `/make-cards` | Extract atomic flashcards from any material |
| `/code-drill` | Get calibrated exercises for your current stage |
| `/weekly-review` | Guided Sunday review process |
| `/gap-fill` | Deep-dive on a specific confusion |
| `/quiz` | Active recall quiz on recent material |

---

## Repository Structure

```
obsidian-learning-path/
├── README.md                    ← this document
├── SETUP.md                     ← step-by-step setup guide
├── CLAUDE.md                    ← template CLAUDE.md — configure for your subject
├── .gitignore
│
├── .claude/
│   └── commands/                ← Claude slash commands
│       ├── study-session.md
│       ├── feynman.md
│       ├── make-cards.md
│       ├── concept-note.md
│       ├── weekly-review.md
│       ├── gap-fill.md
│       └── quiz.md
│
├── templates/                   ← Obsidian note templates (Templater syntax)
│   ├── Cornell Note.md
│   ├── Feynman Explanation.md
│   ├── Concept Note.md
│   ├── Flashcard.md
│   ├── Weekly Review.md
│   └── Project Post-Mortem.md
│
├── vault/                       ← drop-in vault files
│   └── Dashboard.md             ← Dataview-powered progress hub
│
├── scripts/
│   └── setup.sh                 ← bootstrap script — one command to wire everything up
│
└── docs/
    └── methodology.md           ← deep dive on the science behind the system
```

---

## Quickstart

```bash
# 1. Clone the repo
git clone https://github.com/AndresJaramillo/obsidian-learning-path

# 2. Run the setup script — point it at your Obsidian vault
cd obsidian-learning-path
bash scripts/setup.sh /path/to/your/obsidian-vault

# 3. Configure CLAUDE.md
# Edit CLAUDE.md — fill in your subject, goals, and resources

# 4. Restart Obsidian and enable plugins
# Settings → Community Plugins → enable Templater, Dataview, Spaced Repetition

# 5. Open Dashboard.md in your vault and start
```

Full instructions in [SETUP.md](./SETUP.md).

---

## How a Study Session Works

### Before You Start
Open your vault's `Dashboard.md`. It shows:
- Where you are in the roadmap
- Open questions from previous sessions
- Feynman notes with low confidence scores
- Flashcards due for review today

### During Study
**For books and articles:**
1. Pre-read: skim headings, 2 minutes, build a schema
2. Read actively — stop at section breaks
3. Close the source. Open a Cornell Note. Write the summary from memory.
4. Fill the Cue Column: turn your notes into questions
5. Identify flashcard candidates

**For videos:**
1. Pause at every new concept — don't let it wash over you
2. Take timestamped notes
3. After the video: write a one-page summary from memory before checking notes
4. Any concept you can't summarize → Feynman note

**For coding courses and projects:**
1. Retype every example — never copy-paste
2. Predict output before running
3. Every prediction failure → flashcard
4. After each project → Post-Mortem

### After Each Session
- Create flashcards for anything you want to remember in 6 months
- Update Dashboard status if you finished a resource or chapter

### Every Sunday
Run `/weekly-review` with Claude. Takes 30–45 minutes. This is the maintenance session that keeps the system from degrading.

---

## The Five Rules

These are non-negotiable. The system only works if you follow them.

1. **Never end a session without writing something from memory.** Not a copy. Not a highlight. Your own words, retrieved without looking.

2. **Never copy-paste code examples.** Retype them. The friction is the point.

3. **Predict before you run.** Every code example gets a prediction first. Wrong predictions are your most valuable flashcards.

4. **Review flashcards every day.** Even 5 minutes. The spacing effect only works if you don't break the chain.

5. **Sunday review is non-negotiable.** One missed review compounds into two weeks of decayed retention.

---

## Adapting to Your Subject

This system was built for technical subjects (programming, computer science, mathematics, engineering) but generalizes to any domain where understanding matters more than memorization.

**For non-code subjects** (mathematics, physics, law, medicine):
- Replace "Concept Note" with "Problem Walkthrough" — same structure, substitute code blocks with worked examples
- Feynman notes and Cornell notes are domain-agnostic — use them as-is
- Adjust the `/code-drill` command → rename to `/problem-drill` and update the prompt

**To configure for your subject:**
1. Edit `CLAUDE.md` — fill in the `[SUBJECT]`, `[GOAL]`, and `[RESOURCES]` sections
2. Update the roadmap table with your actual learning resources
3. Adjust template tags in each template file to match your domain

---

## Why Claude Is Part of This

Claude is not here to explain things to you. It is here to:

1. **Hold you accountable to the system.** It knows the rules and will enforce them.
2. **Expose gaps.** The Feynman and gap-fill commands push on vague explanations until they break — then target the exact broken part.
3. **Calibrate exercises.** The quiz and drill commands know where you are in your roadmap and generate work at the right level.
4. **Reduce friction on vault maintenance.** Claude creates, links, and updates notes so you can focus on thinking, not filing.

The `CLAUDE.md` file is the key. It gives Claude full context in every session — your subject, your stage, your system — without you having to re-explain anything.

---

## Contributing

If you've adapted this system for a new domain, the adaptation is valuable to others. Open a PR with:
- Your modified `CLAUDE.md` for the domain
- Any domain-specific template modifications
- Notes in `docs/` on how the system translated

---

## License

MIT. Clone it, modify it, use it. Attribution appreciated but not required.

---

*Methodology synthesized from the work of Richard Feynman, Walter Pauk (Cornell method), Piotr Wozniak (spaced repetition), and Barbara Oakley (learning how to learn).*
