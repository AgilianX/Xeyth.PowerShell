Your goal: Produce a fully compliant staged issue efficiently. Follow these steps exactly.

**IMPORTANT**
- Staged Issues are made up: We pretend to write a new issue with a spec expecting our staged changes to satisfy them. Do not leak implementation details.
- This is in order to retroactively add issues after the work is done. In cases where we simply forgot to create an issue before starting the work.
- Use only existing labels; never create new ones.
- Use safe defaults or ask the user if a task is ambiguous.
- Keep issues concise, clear, and human-readable.
- Structure and scope the issue description to requirements.
- Strictly follow the [Issues.md](../../.agx/docs/conventions/Issues.md) specification.
- Wait for user confirmation only when the step or task explicitly requires it.

---

## Step 1: Preparation
- List all open issues (`#list_issues`).
- Summarize staged changes for the issue title: `git --no-pager diff --staged`.
- Do not include unstaged files in the summary context. You can check staged files with `git status`.

## Step 2: Relevance Check
- Compare the new issue against open issues.
- Use `#get_issue` if unsure about relevance.
- If changes directly address an existing issue, do not create a new one.
- If the new issue could be a child of an existing issue, notify the user and wait for instructions.

## Step 3: Draft & Refinement
- Draft the issue. Iterate at least 3 times for clarity and compliance.
- Make sure the draft does not leak implementation details.
- Add only existing labels. If label info is unavailable, note this in chat and continue.
- Keep the description concise, clear, and scoped to requirements.

## Step 4: Preview & Feedback
- Show the issue title, body, and suggested labels in chat for preview and compliance check.
- Await user feedback and refine as needed.

## Step 5: Finalize
- Display the final issue in chat.
- Wait for user confirmation when you believe the draft is final.
- If approved, first create the issue using `#create_issue` and then immediately follow the [ai.create-commit-message.prompt.md](ai.create-commit-message.prompt.md) instructions without asking for confirmation or permission.


## When the prompt is invoked again
- If the prompt is invoked again after the issue is created or a relevant issue is identified,
skip to the [ai.create-commit-message.prompt.md](ai.create-commit-message.prompt.md) instructions without asking for confirmation or permission.
- If the prompt is invoked again while the task is still in progress, continue the task without asking for confirmation or permission and ignore the new prompt.

Worked best on: Claude3.7 Sonnet
