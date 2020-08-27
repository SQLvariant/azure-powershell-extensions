$ScriptBlock = {
        <#
        .SYNOPSIS
        Auto-complete the -StorageAccountName parameter value for Azure Resource Manager (ARM) PowerShell cmdlets.
    
        .NOTES
       
        Created by Trevor Sullivan <trevor@trevorsullivan.net>
        http://trevorsullivan.net
        #>
        param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)

        try {
            $StorageAccountList = Get-AzStorageAccount | Where-Object -FilterScript { $PSItem.StorageAccountName -match $wordToComplete } | ForEach-Object {
                $CompletionText = '{0} -ResourceGroupName {1}' -f $PSItem.StorageAccountName, $PSItem.ResourceGroupName;
                $ToolTip = 'Storage Account "{0}" in "{1}" region.' -f $PSItem.StorageAccountName, $PSItem.Location;
                $ListItemText = '{0} ({1})' -f $PSItem.StorageAccountName, $PSItem.Location;
                $CompletionResultType = [System.Management.Automation.CompletionResultType]::ParameterValue;

                New-Object -TypeName System.Management.Automation.CompletionResult -ArgumentList @($CompletionText, $ListItemText, $CompletionResultType, $ToolTip);
            }

            return $StorageAccountList;
        }
        catch {
            Write-Host -Message ('Error occurred calling argument completer: {0}' -f $PSItem.Exception.Message);
        }
    };

$ArgumentCompleterList = @(
    @{
        CommandName = @(
            'Add-AzHDInsightStorage'
            'New-AzResourceGroup'
            'New-AzResourceGroupDeployment'
            'New-AzStorageContext'
            'Publish-AzVMDscConfiguration'
            'Remove-AzStorageAccount'
            'Restore-AzBackupItem'
            'Set-AzHDInsightDefaultStorage'
            'Set-AzSqlDatabaseAuditingPolicy'
            'Set-AzSqlServerAuditingPolicy'
            'Set-AzVMCustomScriptExtension'
            'Set-AzVMDscExtension'
            'Test-AzResourceGroupTemplate'
        );
        ParameterName = 'StorageAccountName';
        ScriptBlock = $ScriptBlock;
    };
    @{
        CommandName = @(
            'Get-AzStorageAccountKey'
            'New-AzStorageAccountKey'
            'Get-AzStorageAccount'
            'New-AzStorageAccount'
            'Set-AzStorageAccount'
			'Remove-AzStorageAccount'
        );
        ParameterName = 'Name';
        ScriptBlock = $ScriptBlock;
    }
)

foreach ($ArgumentCompleter in $ArgumentCompleterList) {
    Microsoft.PowerShell.Core\Register-ArgumentCompleter @ArgumentCompleter;
}