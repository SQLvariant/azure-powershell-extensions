# Module manifest for module 'AzureExt'
# Generated by: Trevor Sullivan

@{

# Script module or binary module file associated with this manifest.
RootModule = 'AzureExt.psm1';

# Version number of this module.
ModuleVersion = '0.2.5';

# ID used to uniquely identify this module
GUID = 'bd4390dc-a8ad-4bce-8d69-f53ccf8e4163';

# Author of this module
Author = 'Trevor Sullivan <trevor@trevorsullivan.net>';

# Company or vendor of this module
CompanyName = 'Trevor Sullivan';

# Copyright statement for this module
Copyright = '(c) Trevor Sullivan 2015. All rights reserved.';

# Description of the functionality provided by this module
Description = 'This PowerShell module provides extensions on top of the core Microsoft Azure Service Management (ASM) and Azure Resource Manager (ARM) PowerShell modules.
	The goal of this module is to provide command aliases, built-in help documentation, auto-completion functions, and helper functions that make the Microsoft Azure platform easier to use.
    
    Please send feedback about your experience to the project author: Trevor Sullivan <trevor@trevorsullivan.net>. Bugs and feature requests can also be filed on the GitHub issue tracker.';

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '4.0';

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @();

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = @(
    'Format Types\Azure.ResourceGroup.format.ps1xml';
    )

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module
FunctionsToExport = @(
    'Invoke-AzureRemoteDesktop';
    'Invoke-AzureRmRemoteDesktop';
    'Publish-AzureStorageBlob';
    'Unpublish-AzureStorageBlob';
    'Remove-AzureRmResourceGroupGui';
    'Start-AzureRm';
    'Resize-AzureRmVM';
    );

# Cmdlets to export from this module
#CmdletsToExport = '';

# Variables to export from this module
#VariablesToExport = '';

# Aliases to export from this module
AliasesToExport = @(
    'azrdp'
    'azrmrdp'
    'clazpr'
    'gazrg'
    'gazsub'
    'gazwa'
    'gazwapub'
    'nazpr'
    'nazrg'
    'nazsqlsrv'
    'nazvm'
    'nazwa'
    'pubazblob'
    'razpr'
    'razrg'
    'razsqlsrv'
    'razvm'
    'razwa'
    'saazvm'
    'saazwa'
    'sazsub'
    'selazpr'
    'selazsub'
    'spazvm'
    'spazwa'
    'svazpr'
    'unpubazblob'
    '*');

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
FileList = @(
	'AppVeyor.yml'
  , 'AzureExt.psm1'
  , 'AzureExt.psd1'
  , 'AzureExt.tests.ps1'
  , 'README.md'
  , 'Functions\Public\Invoke-AzureRemoteDesktop.ps1'
  , 'Functions\Public\Publish-AzureStorageBlob.ps1'
  , 'Functions\Public\Unpublish-AzureStorageBlob.ps1'
  , 'Functions\Public\Invoke-AzureRmRemoteDesktop.ps1'
  , 'about_AzureExtensions.help.txt'
	)

# Private data to pass to the module specified in RootModule/ModuleToProcess
PrivateData = @{
    PSData = @{
        ### A PowerShell [string[]] array with a list of tags.
        Tags = @('Azure', 'PowerShell', 'cloud', 'automation', 'Intellisense');
        
        ### The PowerShell project's website URI
        ProjectUri = 'https://github.com/pcgeek86/azure-powershell-extensions';

        ### The URI to the file that will be used as the PowerShell module's icon.
        # IconUri = '';

        ### The URI to the license file for the PowerShell module.
        LicenseUri = 'https://trevorsullivan.net/trevor-license.txt';

        ### The URI to the release notes for the current version of the PowerShell module.
        ReleaseNotes = '
        0.2.5 - Added Start-AzureRm command to simplify creating / loading a cached Azure Profile.
        0.2.3 - Removed more code that was depending on TabExpansion++ for caching purposes and the New-CompletionResult command. Should be completely gone now.
        0.2.2 - Removed dependency on TabExpansion++. We are now using the built-in Microsoft.PowerShell.Core\Register-ArgumentCompleter command in PowerShell v5.0.';
    }
}

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

