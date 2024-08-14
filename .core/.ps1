# Define the path to the current directory
$directoryPath = Get-Location

# Remove all items in the current directory except for the parent directory
Get-ChildItem -Path $directoryPath -Exclude ".." | Remove-Item -Force -Recurse