param(
	[string]$server,
	[string]$username,
	[string]$password,
	[string]$script,
	[string]$remove
)

# Create Credential Information
$pw = ConvertTo-Securestring -AsPlainText -Force -String $password
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $pw

# Create New Session
$sess = New-PSSession -ComputerName $server -Credential $cred

# Get TEMP Directory
$temp = Invoke-Command $sess -ScriptBlock { $env:TEMP }

# Copy the script
Copy-Item $script $temp -ToSession $sess

# Create remote launch path
$file = Get-ChildItem $script
$path = $temp + "\" + $file.Name

# Execute the script on remote machine
$result = Invoke-Command $sess -ScriptBlock { powershell -File $args[0] } -argumentlist $path

# Display the result
Write-Output $result

# use remove = true If remove the transferred item 
if ( $remove ) {
	Invoke-Command $sess -ScriptBlock { Remove-Item $args[0] } -argumentlist $path
}
