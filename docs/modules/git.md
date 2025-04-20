# Git Module Documentation

## Overview

This document provides details about the Git module and its configurations within the Xeyth PowerShell project.

## Git Editor Configuration

The Git module includes functionality to dynamically set the Git editor based on the environment. This ensures compatibility with various editors and simplifies the configuration process.

### Editor Detection Logic

The editor is determined based on the parent process name. Below is the mapping:

- **VS Code Insiders**: `code-insiders --wait`
- **VS Code**: `code --wait`
- **Cursor**: `cursor --wait`
- **Rider**: `nano`
- **Visual Studio**: `nano`
- **Default**: `nano`

### Recent Updates

- Added support for `VS Code Insiders` with the renamed path (`code-insiders --wait`).
- Adjusted formatting and indentation for consistency.
- The default path for VS Code Insiders was updated to `$LOCALAPPDATA\Programs\Microsoft VS Code Insiders\bin\`.
- We had to change the path to `$LOCALAPPDATA\Programs\VSCodeInsiders\bin\` to get git to open this editor due to the white spaces. No attempt at escaping the default path worked.

### Environment Variable

The selected editor is stored in the `XEYTH_GIT_EDITOR` environment variable for use in Git operations.

### Configuration Commands

The following commands are required for setting up the Git editor:

1. **Set Git Editor Environment Variable**:
   - Dynamically determines the editor and sets the `XEYTH_GIT_EDITOR` environment variable.

2. **Configure Git Core Editor**:
   - Sets the global Git core editor to the appropriate script path.

### Requirements

- **Git**: Ensure Git is installed. If not, download it from [Git SCM](https://git-scm.com/downloads).
- **Nano**: Install Nano using Chocolatey or Winget:

  ```powershell
  choco install -y nano
  winget install GNU.Nano
  ```

## Public Configuration

The module provides the following public configuration:

```powershell
return XPSConfigure @( { & $SetGitEditor }, { & $SetGitEditorEnvironmentVariable })
```
