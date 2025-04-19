# Xeyth.PowerShell

Personal PowerShell configuration, bootstrapper, and environment setup.

## 🖥️ Remote Bootstrap

To install and activate this configuration on any machine:

### Default

> Defaults to `$HOME\source\repos\Xeyth.PowerShell`

```powershell
irm https://raw.githubusercontent.com/Xeythhhh/Xeyth.PowerShell/refs/heads/master/src/bootstrap.ps1 | iex
```

### Or download and run with a custom path

```powershell
iwr https://raw.githubusercontent.com/Xeythhhh/Xeyth.PowerShell/refs/heads/master/src/bootstrap.ps1 -OutFile bootstrap.ps1
.\bootstrap.ps1 "D:\CustomPath\Xeyth.PowerShell"
Remove-Item .\bootstrap.ps1
```

