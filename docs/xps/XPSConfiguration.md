# XPSConfiguration Module Documentation

## Overview

The `XPSConfiguration` module provides essential configuration management functionalities for the XPS framework. It includes utilities for ensuring required fonts, commands, and modules are available, as well as loading scripts and handling configuration actions.

## Functions

### `XPSConfigure`

- **Description**: Executes a series of configuration actions and logs the results.
- **Parameters**:
  - `Actions`: An array of scriptblocks representing the actions to execute.

### `XPSRequireFont`

- **Description**: Ensures a specific font is installed on the system.
- **Parameters**:
  - `FontName`: The name of the font to check.
  - `helpUrl`: (Optional) A URL providing installation instructions.

### `XPSRequireCommand`

- **Description**: Ensures a specific command is available in the system.
- **Parameters**:
  - `command`: The name of the command to check.
  - `helpUrl`: (Optional) A URL providing installation instructions.

### `XPSRequireModule`

- **Description**: Ensures a specific PowerShell module is available.
- **Parameters**:
  - `module`: The name of the module to check.
  - `helpUrl`: (Optional) A URL providing installation instructions.

### `XPSRequire`

- **Description**: A generic utility to validate a condition and throw an error if the condition is not met.
- **Parameters**:
  - `condition`: A boolean value indicating whether the requirement is met.
  - `message`: The error message to display if the condition is not met.
  - `helpUrl`: (Optional) A URL providing additional help.

### `XPSLoadScripts`

- **Description**: Loads all PowerShell scripts from a specified directory.
- **Parameters**:
  - `directoryPath`: The path to the directory containing the scripts.
  - `description`: A description of the scripts being loaded.
