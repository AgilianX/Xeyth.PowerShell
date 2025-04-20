# XPS Bootstrap Framework Documentation

## Overview

The XPS Bootstrap framework is a modular and extensible system designed to streamline PowerShell configuration and enhance user experience. It provides a structured approach to loading scripts, managing dependencies, and customizing the shell environment.

## Key Features

### Modular Script Loading

- Automatically loads all `*.ps1` scripts from the `xeyth/bootstrap` directory.
- Supports deterministic execution order using numeric prefixes (e.g., `1.0.Git.ps1`, `3.0.DotNet.ps1`).
- Prevents duplicate loading within a session using a global cache (`$global:XeythLoadedScripts`).

### Dependency Management

- Includes `XPSRequire` and `XPSRequireCommand` functions to validate the presence of required tools and modules.
- Provides clear error messages and installation instructions for missing dependencies.

### Enhanced User Experience

- Implements a consistent and user-friendly status output system:
  - `[✓]` for success (green).
  - `[✗]` for errors (red).
  - `[⚠]` for warnings (yellow).
- Centralized output styling using `Write-StatusMessage` and `Write-StatusError` functions.

### Execution Policy Handling

- Ensures the execution policy is set to `RemoteSigned` for the current user.
- Automatically unblocks downloaded scripts using `Unblock-File`.

### PSReadLine Integration

- Configures PSReadLine with a shared `$TokenColors` map for syntax highlighting.
- Aligns token colors with Visual Studio’s default C# theme.

### Oh My Posh Integration

- Integrates Oh My Posh for a visually appealing and informative prompt.
- Includes a custom theme [file](https://github.com/Xeythhhh/Xeyth.PowerShell/blob/master/src/modules/.oh-my-posh/theme.json).

### Scoped Function Convention

- Encapsulates functions within script blocks to prevent global namespace pollution.

### SDK Version Management

- Validates .NET SDK versions using a helper function that strips pre-release suffixes.
- Provides clear error messages and installation links for outdated or missing SDKs.

## File Structure

### Bootstrap Scripts

- Located in `xeyth/bootstrap/`.
- Organized into categories:
  - `1.*` - Core tools (e.g., Git, editor configuration).
  - `2.*` - SDKs and completions (e.g., .NET, PSReadLine).
  - `3.*` - UI/UX enhancements (e.g., bat, Oh My Posh).

### Tests

- Located in `xeyth/bootstrap/tests/`.
- Includes scripts for verifying bootstrap functionality and load order.

### Modules

- Located in `xeyth/modules/`.
- Provides additional functionality and configuration options.

## Modules Documentation

For detailed information about the XPS modules, refer to the [XPS Modules Documentation](modules/XPSModules.md).
