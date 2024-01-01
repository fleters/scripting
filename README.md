# Fleter Scripting

We may have created a useful script for you, please have a look at it first!

## Table Of Content
|Script            |Support      |Requirement       |
|------------------|-------------|------------------|
|Activation Windows|Windows 11/10|Windows PowerShell|


## Activate Windows (only windows 11)
```powershell
cd C:\ ; mkdir temp ; iwr -useb https://raw.githubusercontent.com/fleters/scripting/main/activation-windows-10-11/activate.cmd -OutFile C:\temp\activate.cmd ; iwr -useb https://raw.githubusercontent.com/fleters/scripting/main/activation-windows-10-11/trigger.cmd -OutFile C:\temp\trigger.cmd ; cls ; C:\temp\trigger.cmd ; pause >nul ; exit
```
