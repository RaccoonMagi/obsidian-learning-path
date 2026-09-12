# Learning Methodology — The Science Behind the System

This document explains why the system is built the way it is. Understanding the principles makes you more likely to follow them — and better equipped to adapt the system when your situation changes.

---

## The Core Problem: The Illusion of Knowing

The most dangerous state in learning is not confusion. Confusion is honest — it tells you there's a gap. The most dangerous state is **false confidence**: the feeling of understanding without actual understanding.

This illusion is produced by familiarity. When you read a page and recognize all the words, when you follow a video lecture without losing the thread, when you highlight a passage and nod — your brain flags the material as "known." It isn't. Recognition is not recall. Fluency is not understanding. Familiarity is not knowledge.

Every technique in this system exists to puncture that illusion before it costs you weeks of wasted review.

---

## Principle 1: The Testing Effect (Active Recall)

**The research:** Roediger & Karpicke (2006) showed that students who studied material and then took a test recalled 50% more one week later than students who studied the same material twice. Testing is not just assessment — it is the most effective learning activity available.

**The mechanism:** Retrieval is effortful. When you force your brain to reconstruct information from scratch, the memory trace is strengthened in a way that passive re-exposure cannot produce. The struggle itself is the encoding.

**How this system applies it:**
- Cornell notes: the summary must be written from memory with the source closed
- Feynman technique: the explanation must happen without notes
- Flashcards: designed around retrieval, not recognition (no multiple choice)
- Predict-before-verify: treating every example as a test before a demonstration
- The quiz command: deliberate retrieval practice under mild time pressure

**What it replaces:** Re-reading, highlighting, watching lectures passively. These feel productive because they are effortless. That effortlessness is the problem.

---

## Principle 2: Spaced Repetition

**The research:** Ebbinghaus (1885) documented the forgetting curve: without review, ~70% of new information is lost within 24 hours. The same information reviewed at increasing intervals stays accessible indefinitely. Wozniak (1985) formalized this into an algorithm — the foundation of modern SRS systems.

**The mechanism:** Memory consolidates during rest and sleep. Reviewing information at the moment it would otherwise decay strengthens the trace more than reviewing it immediately. The optimal review interval grows longer with each successful retrieval.

**How this system applies it:**
- Obsidian Spaced Repetition plugin implements the SM-2 algorithm (same algorithm as Anki)
- Flashcards are reviewed daily — the plugin surfaces only what needs review
- Weekly reviews prevent systematic decay of concepts that didn't make it into cards

**What it replaces:** Cramming and re-reading. Cramming produces recall that evaporates within days. Spaced repetition produces recall that lasts years.

**The one rule:** Daily review, even for 5 minutes. Missing days breaks the spacing effect. One missed day becomes two. Two becomes a week. The chain must not break.

---

## Principle 3: The Feynman Technique

**The source:** Attributed to physicist Richard Feynman, who was famous for being able to explain any concept in physics to a non-expert without losing accuracy. His method: if you can't explain it simply, you don't understand it.

**The mechanism:** Jargon is a hiding place for incomplete understanding. When you explain a concept using the correct technical terms, you can appear to understand it while actually just recognizing the vocabulary. Forcing plain-language explanation removes that hiding place. The exact moment your explanation breaks down or reaches for jargon is the exact location of your gap.

**The four steps:**
1. Choose a concept
2. Explain it in plain language as if teaching a child — no jargon
3. Find where the explanation breaks down (this is the gap)
4. Return to the source, study only the gap, and simplify the explanation further

**How this system applies it:**
- Every concept studied gets a Feynman note
- The `/feynman` command runs the loop interactively with Claude
- Confidence scores (1–5) track which concepts need another pass
- The Feynman note's "plain language" section is strictly enforced — no jargon allowed

**Diagnostic rule:** If you can't complete an analogy for the concept, the understanding is incomplete. An analogy requires genuinely grasping the structure of an idea, not just its vocabulary.

---

## Principle 4: Cornell Note-Taking

**The source:** Walter Pauk, Cornell University, 1950s. Originally developed to help college students take lecture notes that were actually useful for studying.

**The mechanism:** Traditional notes are a passive record. Cornell notes are a retrieval system. The cue column transforms notes into self-quiz material. The summary forces synthesis at the level of meaning, not detail.

**The three sections:**
1. **Notes column (during):** Capture information in your own words. Diagrams, examples, connections.
2. **Cue column (after):** Turn notes into questions. Close the source. This section is filled in after, not during.
3. **Summary (after):** Write a 3–5 sentence synthesis from memory. Source closed. No looking.

**The critical rule:** The summary is written after closing the source and the notes column. If you write the summary while looking at your notes, you have turned it into copying — not synthesis.

**How this system applies it:**
- All chapter and video notes use the Cornell template
- The cue column becomes flashcard candidates
- The summary becomes the Feynman input

---

## Principle 5: Interleaved Practice

**The research:** Rohrer & Taylor (2007) showed that interleaving different problem types during practice produces better long-term retention and transfer than blocking (doing all problems of one type, then all of another). Interleaving feels harder and slower — and outperforms blocked practice by ~40% on delayed tests.

**The mechanism:** Blocked practice allows the brain to keep the solution method in working memory. Interleaved practice forces the brain to retrieve the right approach for each problem from scratch — identical to what happens in real-world application.

**How this system applies it:**
- The quiz command deliberately mixes topics, not just one
- Weekly reviews surface older material alongside recent material
- The roadmap is designed to revisit concepts across multiple resources (e.g., binary representation appears in the Code book, Crash Course CS, and Nand2Tetris at different levels of depth)

---

## Principle 6: Desirable Difficulty

**The research:** Bjork (1994) coined "desirable difficulties" — conditions that make learning slower and harder in the short term but more durable long-term. Examples: retrieval practice, spaced repetition, interleaving, reducing feedback.

**The core insight:** Ease of learning in the moment is negatively correlated with durability of memory. The techniques that feel most effective (re-reading, massed practice, immediate feedback) are among the least durable. The techniques that feel slow and frustrating (retrieval, spacing, interleaving) are the most durable.

**The implication for this system:** When a technique feels inefficient — when writing a summary from memory is slower than copying, when predicting output feels unnecessary when you could just run it — that friction is not a bug. It is the mechanism. Do not optimize it away.

---

## Principle 7: Project-Based Consolidation

**The insight:** Declarative knowledge (knowing that) and procedural knowledge (knowing how) are stored and retrieved differently. Reading about a concept builds declarative knowledge. Building with the concept builds procedural knowledge. Both are necessary. Neither substitutes for the other.

**How this system applies it:**
- Every theoretical resource in the roadmap is paired with a project-based resource
- Post-mortems are required after every project — they force articulation of what the project actually taught
- The "Concepts I Now Actually Understand" section of the post-mortem is the highest-value output: concepts that became procedural through doing

---

## Principle 8: Metacognition

**The research:** Dunlocker (1945), elaborated by Flavell (1976): the ability to accurately assess your own understanding is itself a learnable skill and a strong predictor of learning outcomes.

**The mechanism:** Most learners are overconfident about what they know. Confidence is correlated with familiarity, not with actual ability to retrieve and apply. Calibrated learners know which parts of their knowledge are solid and which are illusory — and they study accordingly.

**How this system applies it:**
- Feynman confidence scores (1–5) force explicit self-assessment per concept
- Weekly reviews require honest accounting of what stuck and what didn't
- The predict-before-verify pattern exposes miscalibration in real time
- The gap-fill command is initiated by the learner naming where their understanding breaks — this requires metacognitive awareness

---

## The Role of Claude in This System

Claude is not a tutor in the conventional sense. A tutor who explains things clearly can actually impede learning by removing the productive struggle that creates retention.

Claude's role in this system is:

1. **Accountability partner** — enforcing the system's rules even when it's inconvenient
2. **Gap detector** — pushing on vague explanations until the exact gap is found
3. **Exercise generator** — producing calibrated practice material at the right level
4. **Vault maintainer** — handling the administrative work of note creation so the learner focuses on thinking
5. **Socratic interlocutor** — asking questions rather than giving answers during project work

The `CLAUDE.md` file is what makes this work across sessions. Without it, Claude has no memory of your subject, your stage, your system, or your rules. With it, every session starts with full context.

---

## Sources and Further Reading

- Roediger & Karpicke (2006). *Test-enhanced learning: Taking memory tests improves long-term retention.* Psychological Science.
- Ebbinghaus, H. (1885). *Memory: A contribution to experimental psychology.*
- Wozniak, P. (1985). *Optimization of learning.* SuperMemo documentation.
- Bjork, R.A. (1994). *Memory and metamemory considerations in the training of human beings.* In J. Metcalfe & A. Shimamura (Eds.), Metacognition.
- Rohrer, D. & Taylor, K. (2007). *The shuffling of mathematics problems improves learning.* Instructional Science.
- Oakley, B. (2014). *A Mind for Numbers.* Tarcher/Perigee.
- Brown, P., Roediger, H., McDaniel, M. (2014). *Make It Stick: The Science of Successful Learning.* Harvard University Press.
