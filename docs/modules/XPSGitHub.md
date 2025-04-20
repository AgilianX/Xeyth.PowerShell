# XPSGitHub Module Documentation

## Overview

The `XPSGitHub` module integrates GitHub functionalities into the XPS framework. It provides utilities for fetching issues and determining repository details.

## Functions

### `XPSFetchIssues`

- **Description**: Fetches open issues from the GitHub repository associated with the current project.
- **Usage**: Requires a valid GitHub API token stored in the `.xeyth/.GitHubApiToken` file.

> This helper function exists mainly to pull issues from a repository for an AI agent

## Setup Instructions

To use the `XPSGitHub` module, ensure the following setup:

1. Create a `.xeyth` folder in the root of your project.
2. Inside the `.xeyth` folder, create a `.GitHubApiToken` file.
3. Add your GitHub API token to the `.GitHubApiToken` file.
4. Ensure the `.xeyth` folder is ignored in your `.gitignore` file to prevent accidental commits of sensitive information.

### Example `.gitignore` Entry

```ignore
# Ignore the .xeyth folder
.xeyth/
```
