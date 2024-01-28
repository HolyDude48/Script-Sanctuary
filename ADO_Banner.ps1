# Simple script that allows you to add banner to multiple Azure DevOps Organisations!!!

# Define the path to the CSV file containing Azure DevOps organizations
$csvFilePath = "C:\1_Scripts\ADO_Lists\Azure_DevOps_Organizations-Jan24.csv"

# Read the CSV file
$organizations = Import-Csv -Path $csvFilePath

# Azure CLI command to add a banner
$azDevOpsCommand = "az devops admin banner add --message 'General notification banner. <a href=''https://github.com/''>More information</a>' --type warning --id banner-101 --expiration '2024-12-31 15:30:00 UTC'"

# Iterate through each organization
foreach ($org in $organizations) {
    # Construct the full Azure CLI command for each organization
    $fullCommand = "$azDevOpsCommand --org $($org.Url)"

    # Execute the Azure CLI command
    Invoke-Expression -Command $fullCommand
}


# 15:30 UTC = 9pm IST
