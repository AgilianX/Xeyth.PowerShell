# 📚 DevOps Summary Tracking Workflow

## 🔹 Purpose

Each DevOps tool or concept will have its own markdown file named `{ToolName}.md` (e.g., `Git.md`). These files serve as ongoing summaries of everything learned, discussed, or implemented related to that tool.

---

## 🔹 Workflow

1. **Top of the file**

   - Name of the tool
   - Link to official tool documentation
   - Context of why we are using this tool
   - Links to other .md files we documented that integrate to this tool
   - Use link reference definitions if the link is too long. For header links, place the link definition right after the referenced header (no html!!)

2. **Body: Session-Based Updates**
   After each relevant session:
   - The assistant will create or update the corresponding `{ToolName}.md` file.
   - All new information is appended to the existing content. **No information from prior sessions will be removed.**
   - Each update will be clearly separated and timestamped within the file for traceability.
   - Ensure consistent style, can reference other summary files in the repo!
   - Use link reference definitions if the link is too long. For header links, place the link definition right after the referenced header (no html!!)
   - Example:

   > ```md
   > Table of contents:
   > - {PreviousTocLinks}
   > - [Summary][session-link-definition]
   >
   > ... {PreviousContent}
   > ---
   >
   > ## Session {Timestamp} {Summary}
   >
   > [session-link-definition]: #session-{timestamp}-{summary}
   >
   > {SessionBody}
   > ```

3. **Commits**
   - After chiseling and aproval, we craft a commit message adhering to [Commits.md](../.agx/docs/conventions/Commits.md).

4. **Referencing Summaries**
   - In future sessions, the assistant will reference the latest uploaded `{ToolName}` summary to maintain context.
   - If the file is missing, the assistant will start a new one based on the session’s content.

5. **Content Guidelines**
   - Use clean markdown structure: headings, bullet points, code blocks.
   - Focus on clarity, practicality, and cumulative learning.

6. **Scope**
   This applies to all technologies in the `docs/research` folder.
