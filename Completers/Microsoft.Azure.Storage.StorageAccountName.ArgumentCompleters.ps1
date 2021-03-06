$ArgumentCompleter =     @{
        CommandName = @('Enable-WAPackWebsiteApplicationDiagnositc', 
                    'Add-AzureHDInsightStorage', 
                    'Enable-AzureWebsiteApplicationDiagnostic', 
                    'Get-AzureStorageAccount', 
                    'Get-AzureStorageKey', 
                    'New-AzureMediaServicesAccount', 
                    'New-AzureStorageAccount', 
                    'New-AzureStorageContext', 
                    'New-AzureStorageKey', 
                    'Publish-AzureServiceProject', 
                    'Remove-AzureStorageAccount', 
                    'Set-AzureHDInsightDefaultStorage', 
                    'Set-AzureStorageAccount', 
                    'Set-AzureVMCustomScriptExtension' );
        ParameterName = 'StorageAccountName';
        #Description = 'Complete the -StorageAccountName parameter value for Azure cmdlets:  Get-AzureStorageAccount -StorageAccountName <TAB>';
        ScriptBlock =  {
        <#
        .SYNOPSIS
        Auto-complete the -StorageAccountName parameter value for Azure PowerShell cmdlets.
    
        .NOTES
       
        Created by Trevor Sullivan <trevor@trevorsullivan.net>
        http://trevorsullivan.net
        #>
        param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)

        #Write-Verbose -Message ('Called Azure StorageAccountName completer at {0}' -f (Get-Date))

        $StorageAccountList = Get-AzureStorageAccount -WarningAction SilentlyContinue | Where-Object {$PSItem.StorageAccountName -match ${wordToComplete} } | ForEach-Object {
            $CompletionText = $PSItem.StorageAccountName
            $ToolTip = 'Storage Account "{0}" in "{1}" region.' -f $PSItem.StorageAccountName, $PSItem.Location
            $ListItemText = '{0} ({1})' -f $PSItem.StorageAccountName, $PSItem.Location
            $CompletionResultType = [System.Management.Automation.CompletionResultType]::ParameterValue

            New-Object -TypeName System.Management.Automation.CompletionResult -ArgumentList @($CompletionText, $ListItemText, $CompletionResultType, $ToolTip);
        }

        return $StorageAccountList
        }
    }

Microsoft.PowerShell.Core\Register-ArgumentCompleter @ArgumentCompleter;