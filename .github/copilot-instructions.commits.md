# 🧠 AI Agent Taskflow: Generating Commits

## 🎯 Objective

Produce a **fully compliant commit message** and finalize the commit without waiting for user confirmation. Follow all instructions strictly.

---

## ✅ Step 1: Prepare

1. **Run**: `XPSFetchIssues`
   - Collect all open issues.
2. **Run**: `git --no-pager diff --staged`
   - If **no staged changes**, run:
     `git add .`
     Then run the diff command again.
3. **Read**: The diff output and identify the nature of the changes.

---

## 🔍 Step 2: Determine Issue Relevance

- Match the staged changes against the descriptions of the open issues.
- Only include `@issue` if the changes **directly address** an issue’s description or requirements.
- If unsure or unclear (less than 100% certainty), use:
  `#issue_summarize` to determine relevance.
- If no match or it's too generic, **do not** add `@issue`.

---

## 🧠 Step 3: Craft the Commit Message

1. **Think deeply** and iterate at least **3 times** on the message.
2. Follow the [Commit spec](../docs/conventions/Commits.md) religiously:
   - **Only one `type`** per commit (pick the most relevant).
   - Ensure the message is **spec compliant**.
   - `@issue`: Only if directly related (see above).
   - `@semver`: Only when explicitly instructed.
   - `@nuke`: Only when explicitly instructed and a target is available in the build project.

---

## 📤 Step 4: Show Commit Message (First Preview)

- Display the commit message in chat.

---

## 🔁 Step 5: Final Verification (Refinement)

1. **Re-check the type** against the [Commit specification](../docs/conventions/Commits.md), especially the clarification at the end of the file.
2. **Re-check the scope** against the nature of our changes.
3. **Re-check the issue relevance** (especially if `@issue` is present).
4. **Refine** the commit message.

---

## ✅ Step 6: Finalize

- **Display the final commit message again in chat.**.

---

## 📝 IMPORTANT

- Follow this flow **exactly** as described.
- Do not deviate from the instructions.
- Do not skip message preview.
- Do not skip refinement steps.
- Never wait for confirmation or permission once you've started this task.
- Every commit must **strictly follow the [Commit specification](../docs/conventions/Commits.md)**.
- If a task is ambiguous, prefer safe defaults (e.g., omit `@issue`).
