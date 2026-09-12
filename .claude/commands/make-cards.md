Extract spaced repetition flashcards from the user's notes or a concept they describe.

**Step 1 — Get the material**
Ask: "Paste the notes or concept you want cards from, or tell me the topic."

If they paste notes: extract cards from the content.
If they name a topic: check relevant Concept, Cornell, or Feynman notes in the vault first.

**Step 2 — Card extraction rules**

Apply without exception:
- One atomic fact per card — never two facts on one card
- Prefer "Why does X happen?" and "What does this produce/output?" over pure definitions
- A card requiring more than 10 words to answer is too broad — split it

Priority order:
1. Behavior/output cards — show input, ask what happens
2. Why cards — ask the mechanism behind a behavior
3. Gotcha/mistake cards — common errors and why they happen
4. Definition cards — only for genuinely atomic, irreducible facts

**Step 3 — Format for Obsidian Spaced Repetition**

Single-line (inline):
```
Question :: Answer
```

Multi-line:
```
Question
?
Answer
```

Separate cards with `---`.

**Step 4 — Offer to write to vault**
Ask: "Want me to write these to `[SUBJECT]/Flashcards/`? What should the file be named?"

If yes: create using the Flashcard template with proper frontmatter (type, topic, source, date, tags, sr-due, sr-interval, sr-ease).

**Step 5 — Remind**
"Review these in Obsidian with the Spaced Repetition plugin daily. Even 5 minutes keeps the memory trace alive."
