<#
Adobe-Audition-AMIO-Plugin-Maintianer
https://github.com/border-blaster
v2024-06-20:0954
#>

<#
Instructions: 
You need to fill in the path of whatever you use for the local unilites ($SourcePath) and the file names of your plugins ($FilesToCheck). Match them up with where the GPO is placing the files.
#>


$StartingDirectory = "C:\Program Files\Adobe"
$DirectoryString = "Adobe Audition"
$SourcePath = "C:\Windows\<YOUR_LOCAL_UTITLTY_FOLDER\WO_Plugins"
$FilesToCheck = @("WO_Automation_For_Radio_64_RD.amio", "WO_Automation_For_Radio_64_WR.amio")

# Get a list of folders that start with the specified directory string
$Folders = Get-ChildItem -Path $StartingDirectory -Directory | Where-Object { $_.Name -like "$DirectoryString*" }

# Check each folder for the "plugins\amio" path and then for the required files
foreach ($Folder in $Folders) {
    $PluginsPath = Join-Path -Path $Folder.FullName -ChildPath "plugins"
    $AmioPath = Join-Path -Path $PluginsPath -ChildPath "amio"
    
    if (Test-Path -Path $AmioPath) {
        Write-Output "Found 'amio' folder in: $AmioPath"
        
        foreach ($File in $FilesToCheck) {
            $FilePath = Join-Path -Path $AmioPath -ChildPath $File
            if (-Not (Test-Path -Path $FilePath)) {
                Write-Output "File '$File' not found in: $AmioPath. Copying from source."
                Copy-Item -Path (Join-Path -Path $SourcePath -ChildPath $File) -Destination $FilePath
            } else {
                Write-Output "File '$File' already exists in: $AmioPath"
            }
        }
    } else {
        Write-Output "'amio' folder not found in: $PluginsPath"
    }
}
