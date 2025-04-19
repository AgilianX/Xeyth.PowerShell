# Xeyth.PowerShell

Personal PowerShell configuration, bootstrapper, and environment setup.

## 🖥️ Remote Bootstrap

To install and activate this configuration on any machine:

```powershell
# Default path (recommended):
irm https://raw.githubusercontent.com/Xeythhhh/Xeyth.PowerShell/refs/heads/master/src/bootstrap.ps1 | iex
```

```powershell
# Or download and run with a custom path:
iwr https://raw.githubusercontent.com/Xeythhhh/Xeyth.PowerShell/refs/heads/master/src/bootstrap.ps1 -OutFile bootstrap.ps1
.\bootstrap.ps1 "D:\CustomPath\Xeyth.PowerShell"
```

> Defaults to `$HOME\source\repos\Xeyth.PowerShell`
