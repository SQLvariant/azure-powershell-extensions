<img src="https://ci.appveyor.com/api/projects/status/rj6yk9p8d0bwonpn?svg=true" />

# Introduction

This PowerShell script module project is intended to offer extensions to the Microsoft Azure PowerShell module, to simplify interactive use, and fill in functional & documentation gaps. 
The specific areas that it will help fill are:

- PowerShell Proxy functions - Simplify cmdlet calls that are unnecessarily complicated by default.
- PowerShell Aliases - Reduce the amount of typing necessary to run Azure PowerShell commands interactively.
- PowerShell about_* Help - Provide built-in PowerShell help that users are accustomed to, instead of browsing the web.
- Auto-completer Functions - Automatic tab-completion for parameter values, to reduce the need to memorize cloud resource names.

# Installation

**IMPORTANT**: The `AzureExt` module has a dependency on the `Register-ArgumentCompleter` command, which is available in PowerShell version 5.0. Please see the "Argument Completers" heading below for more information.

The Azure PowerShell Extensions module is being developed and tested against PowerShell 5.0 on Windows 10 Enterprise RTM (Build 10240).
PowerShell 5.0 introduces the centralized [PowerShell Gallery](http://powershellgallery.com), which is exposed via the built-in `PowerShellGet` module.
PowerShell 5.0 can be installed on down-level operating systems, including Windows 7, Windows 8.1, Windows Server 2012 and 2012 R2, by way of the *"Windows Management Framework 5.0"* package.

In PowerShell 5.0, using the `Find-Module` command, you can search for the latest version of the `AzureExt` module.

```
PS C:\Users\TrevorSullivan> Find-Module -Name AzureExt | Format-Table -AutoSize

Version Name     Repository Description
------- ----     ---------- -----------
0.1.31  AzureExt PSGallery  This PowerShell module provides extensions on top of the core Microsoft Azure Service Ma...
```

Using PowerShellGet's `Install-Module` command, you can easily install the `AzureExt` module.
You can use the `-Scope` parameter to install the module for the currently logged-in user, or for all users of the system.
To install a PowerShell module for all users, you must be running the PowerShell process as an Administrator of the system.

```
Install-Module -Name AzureExt -Scope CurrentUser;
```

When a new version of the module has been released, make sure to update it.

```
Update-Module -Name AzureExt;
```

For more information about `PowerShellGet` commands, use PowerShell's core `Get-Command` command:

```
PS C:\Users\TrevorSullivan> Get-Command -Module PowerShellGet | Format-Table -AutoSize;

CommandType Name                    Version Source
----------- ----                    ------- ------
Function    Find-Module             1.0     PowerShellGet
Function    Get-InstalledModule     1.0     PowerShellGet
Function    Get-PSRepository        1.0     PowerShellGet
Function    Install-Module          1.0     PowerShellGet
Function    Publish-Module          1.0     PowerShellGet
Function    Register-PSRepository   1.0     PowerShellGet
Function    Save-Module             1.0     PowerShellGet
Function    Set-PSRepository        1.0     PowerShellGet
Function    Uninstall-Module        1.0     PowerShellGet
Function    Unregister-PSRepository 1.0     PowerShellGet
Function    Update-Module           1.0     PowerShellGet
```

# Usage

Once the module has been installed, simply call `Import-Module -Name AzureExt;` in order to begin using its features.
PowerShell 3.0 and later support a concept called "module auto-loading," which enables certain features (eg. explicitly exported aliases and functions) to be accessed without explicitly importing the module.
However, we recommend importing the module, to ensure that all features (including auto-completers) are accessible.

# Features

## Functions

The `AzureExt` PowerShell module includes some useful functions that make it easier to work with the Azure PowerShell module. These are not intended to replace the Azure PowerShell module, but to provide a more user-friendly experience on top of it.

- **Remove-AzuremRmResourceGroupGui** - This command enables you to delete multiple Microsoft Azure Resource Manager (ARM) Resource Groups at once, by CTRL + clicking them in the dialog that pops up
- **Start-AzureRm** - The Microsoft Azure Resource Manager (ARM) PowerShell module removed the default behavior of caching your token. To simplify logging into Azure, each time you start a new PowerShell session, the `Start-AzureRm` command caches your token, and if it has expired, then it will prompt you to authenticate using the faster-loading `Get-Credential` command.

## Aliases

The abbreviation "az" will generally be used to refer to "Azure" in PowerShell command aliases, to differentiate them from other aliases.

The following aliases are supported by this module:

### Azure Profile

The following PowerShell aliases apply to Azure authentication and subscription management.

- **aazac** - Add-AzureAccount
- **razac** - Remove-AzureAccount

### Virtual Machines

The following PowerShell aliases apply to Virtual Machine commands.

- **nazvmc** - New-AzureVMConfig


### Azure Storage

- **nazsa** - New-AzureStorageAccount
- **razsa** - Remove-AzureStorageAccount

## Auto-Completion

Auto-completers are PowerShell ScriptBlocks that provide Intellisense & tab-completion for PowerShell command parameter values. 
These functions require the presence of the `Register-ArgumentCompleter` PowerShell command, which is available in PowerShell version 5.0.

**NOTE**: The AzureExt module **must** be imported in order for the Intellisense extensions to be registered.
To simplify this process, each time you launch a new PowerShell session, you can add a line to your PowerShell profile to import the module:

```
Import-Module -Name AzureExt;
Start-AzureRm;
```

**IMPORTANT**: For most argument completer functions, you must be authenticated to Microsoft Azure.
Starting with the 1.0 release of the Azure Resource Manager module, token caches are not automatically saved between PowerShell sessions. To simplify the process of authenticating each time you login, we created a command called `Start-AzureRm`.

For Azure Service Management commands, use `Add-AzureAccount` to login. 
For Azure Resource Manager commands, use `Login-AzureRmAccount` to login.

This module includes auto-completion for the following Azure entitites.

### Service Management

- Subscription names
- Cloud Service names
- Virtual Machine names

### Resource Manager 

- Azure Locations
- Resource Group names
- Virtual Machine names
- Storage Accounts
- Resource Name, Resource Type, Resource Group Name for generic ARM "resource" commands

## Snippets

The AzureExt module provides a number of useful PowerShell code snippets that can be used in the PowerShell Integrated Scripting Editor (ISE). Snippets are provided for things such as:

- JSON declaration of Azure Resource Manager (ARM) resources
  - For example, you could build an ARM JSON Template in a PowerShell here-string, without leaving the ISE
- Deploy an Azure Resource Manager (ARM) JSON Template

To utilize these code snippets, run the following commands:

```
Import-Module -Name AzureExt;
Import-IseSnippet -Module AzureExt;
```

## Built-in Help

# Authors

The founder of this project is [Trevor Sullivan](https://trevorsullivan.net).

# Contributing

You can participate in the development of the Azure PowerShell Extensions module in a variety of different ways.

## Issues / Enhancements

You can report bugs or feature enhancements on the GitHub Issue Tracker.

## Chat

You can participate in project chat using the Gitter service.

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/pcgeek86/azure-powershell-extensions?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## Pull Requests

If you want to add a feature and submit a Pull Request, feel free to. 
Simply fork the project into your own repository, commit to a new branch, and then submit a Pull Request targeting the `master` branch of this project.
