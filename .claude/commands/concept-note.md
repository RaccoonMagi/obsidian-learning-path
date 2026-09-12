Generate a targeted exercise for the user to work through a concept hands-on.

**Step 1 — Calibrate**
Ask:
1. "What concept or topic should we drill?"
2. "What resource are you currently on?" (to match depth to roadmap stage)
3. "Format: (a) predict the output of an example, (b) derive or solve from scratch, or (c) find and fix what's broken?"

**Step 2 — Generate the exercise**

Match difficulty to where the user is in the roadmap. Earlier stages get foundational exercises. Later stages get edge cases and combinations.

**For output/prediction exercises:**
Present the example. Do NOT include the answer. Wait for their prediction, then reveal and explain every non-obvious behavior.

**For derive/solve-from-scratch exercises:**
Give a clear spec with explicit constraints. No starter skeleton unless requested.
Example:
```
Implement [thing] that satisfies:
- [constraint 1]
- [constraint 2]
- [constraint 3]
```

**For debugging exercises:**
Present broken material with a description of intended behavior. Do not name the bug.
```
This is supposed to [intended behavior]. It has a bug. Find it and fix it.
```

**Step 3 — Review their answer**
When they share their solution:
- Identify: misconceptions, missed edge cases, unstated assumptions, unnecessary complexity
- Ask: "Did this match what you expected? Was there anything that surprised you?"
- If correct: ask them to explain *why* it works — not just that it does
- If incorrect: ask guiding questions rather than giving the fix

**Step 4 — Follow-up**
"What from this should become a flashcard?" Offer to run `/make-cards`.
