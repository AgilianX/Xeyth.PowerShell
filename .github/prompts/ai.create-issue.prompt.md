Your goal: Produce a fully compliant issue efficiently. Follow these steps exactly.

**IMPORTANT**
- Use only existing labels; never create new ones.
- Use safe defaults or ask the user if a task is ambiguous.
- Keep issues concise, clear, and human-readable.
- Structure and scope the issue description to requirements.
- Strictly follow the [Issues.md](../../.agx/docs/conventions/Issues.md) specification.
- Wait for user confirmation only when the step or task explicitly requires it.

---

## Step 1: Preparation
- List all open issues (`#list_issues`).
- Summarize staged changes for the issue title: `agx-ai-diff-staged`.
- Do not include unstaged files in the summary context. You can check staged files with `git agx-ai-status`.

## Step 2: Relevance Check
- Compare the new issue against open issues.
- Use `#get_issue` if unsure about relevance.
- If changes directly address an existing issue, do not create a new one.
- If the new issue could be a child of an existing issue, notify the user and wait for instructions.

## Step 3: Draft & Refinement
- Draft the issue. Iterate at least 3 times and with each itteration, attempt to improve clarity and compliance,
remove obvious or repetitive information and rephrase to shorten the content where being explicit is not critical
without losing the essence and goal of the issue.
- Make sure the draft does not leak implementation details.
- Add only existing labels. If label info is unavailable, note this in chat and continue.
- Keep the description concise, clear, and scoped to requirements.

## Step 4: Preview & Feedback
- Show the issue title, body, and suggested labels in chat for preview and compliance check.
- Show the user available labels and ask for confirmation on the selected labels.
- Show the user available Issue Types and ask for confirmation on the selected type.
- Await user feedback and refine as needed.

## Step 5: Finalize
- Display the final issue in chat.
- Wait for user confirmation when you believe the draft is final.
- If approved, create the issue using `#create_issue`.
- If the issue is meant to be a sub-issue, make sure it is created as a sub-issue of the parent issue.


## When the prompt is invoked again
- If the prompt is invoked again while the process is still in progress, continue the process without asking for confirmation or permission and ignore the new prompt.
