## Goal
Generate a standards-compliant commit message and execute the commit without user interaction beyond showing the final draft.

**IMPORTANT**
- Follow the [Commits.md](../../.agx/docs/conventions/Commits.md) specification precisely.
- Select one appropriate `type` per commit based on the most significant change.
- For AI-related files (prompts, workflows, configs), prioritize the `ai` type.
- Use context from relevant issues in the commit message when applicable.
- Never include implementation details in messages.
- Never use `git commit`, always use `git agx-ai-commit` WITHOUT ARGUMENTS to open the editor with the message for review.

---

## Step 1: Analysis
- Run `git agx-ai-diff-staged` to analyze staged changes
- You can see the staged files with `git agx-ai-status`
- List open issues using the `#list_issues` tool
- Identify affected components and appropriate scope

## Step 2: Issue Correlation
- Determine if changes directly address any open issues
- Use `#get_issue <number>` for detailed context if needed
- Include `@issue:#XXX` only when changes directly resolve or address an issue

## Step 3: Message Formation
- Structure the message according to the specification:
  ```xml
  <type>(<scope>): <concise summary>

  - <bullet describing what changed>
  - <bullet describing why/how if relevant>

  <optional BREAKING CHANGE note>
  <metadata tags>
  ```
- Include metadata tags only when appropriate:
  - `@issue:#XXX` - For directly related issues
  - `@semver:level` or `@nuke:target` - Only when explicitly instructed

## Step 4: Validation
- Verify type and scope appropriateness per specification
- Iterate at least 3 times and with each itteration, attempt to improve type, scope and compliance,
remove obvious or repetitive information and rephrase to shorten the content where being explicit is not critical.
- Ensure message is concise, clear, and focuses on WHAT changed (not HOW)
- Check that bullet points add meaningful context

## Step 5: Finalize
- Display the final draft message in a code block
- Run `git agx-ai-commit` to open the editor with the message for review AFTER displaying the draft.

---

**Scopes:**
- You can use `git agx-ai-lg` to get inspiration on the commit message scopes and types to keep things consistent.
- You can also cross reference the output of `git agx-ai-lg` with the files present in `docs/research` for `learn(<scope>)` type commits.

**Reminders:**
- Avoid assumptions. Omit optional metadata if unsure.
- Only use the staged files to determine what the commit addresses.
- Never leak implementation details in commit messages.
- Prioritize clarity and full compliance with the [Commits.md](../../.agx/docs/conventions/Commits.md) specification.

Worked best on: Claude3.7 Sonnet
