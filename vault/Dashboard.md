---
type: dashboard
tags: [learning, dashboard]
---

# [SUBJECT] — Learning Dashboard

> Open this first every session. Your system at a glance.

---

## Roadmap Progress

<!-- Update statuses: 🔲 Not Started · 🟡 In Progress · ✅ Done -->

| # | Resource | Type | Status |
|---|---|---|---|
| 1 |  | Book | 🔲 Not Started |
| 2 |  | Video | 🔲 Not Started |
| 3 |  | Course | 🔲 Not Started |

> Add your resources here. Edit this table as you progress.

---

## Recent Notes

```dataview
TABLE file.mtime AS "Last Modified", type AS "Type", source AS "Source"
FROM "Learning/[SUBJECT]"
WHERE type != "dashboard"
SORT file.mtime DESC
LIMIT 10
```

---

## Open Questions & Gaps

```dataview
TASK
FROM "Learning/[SUBJECT]"
WHERE !completed
LIMIT 20
```

---

## Feynman Notes — Lowest Confidence First

```dataview
TABLE confidence AS "Confidence (1–5)", concept AS "Concept", date AS "Date"
FROM "Learning/[SUBJECT]/Feynman"
SORT confidence ASC
```

---

## Concepts Still Not Understood

```dataview
TABLE source AS "Source", chapter AS "Chapter", date AS "Date"
FROM "Learning/[SUBJECT]/Concept Notes"
WHERE understood = false
SORT date DESC
```

---

## Weekly Reviews

```dataview
TABLE week AS "Week", date AS "Date"
FROM "Learning/[SUBJECT]/Weekly Reviews"
SORT date DESC
LIMIT 8
```

---

## Template Quick Reference

| Template | Use When | Insert via |
|---|---|---|
| **Cornell Note** | Every chapter or video section | `Cmd+P` → Templater |
| **Feynman Explanation** | After studying any concept | `Cmd+P` → Templater |
| **Concept Note** | Every new syntax, formula, or pattern | `Cmd+P` → Templater |
| **Flashcard** | Anything to retain long-term | `Cmd+P` → Templater |
| **Weekly Review** | Every Sunday | `Cmd+P` → Templater |
| **Project Post-Mortem** | After every project or problem set | `Cmd+P` → Templater |

---

## Claude Commands

Run these from the terminal in this directory:

| Command | Purpose |
|---|---|
| `/study-session` | Plan a focused session |
| `/feynman` | Walk through the Feynman technique |
| `/make-cards` | Extract flashcards from material |
| `/concept-note` | Get a coding/worked exercise |
| `/weekly-review` | Guided Sunday review |
| `/gap-fill` | Deep-dive on a confusion |
| `/quiz` | Get quizzed on recent material |

---

## The Five Rules

1. Never end a session without writing something from memory
2. Never copy-paste examples — retype them
3. Predict before you verify
4. Review flashcards every day, even 5 minutes
5. Sunday review is non-negotiable
