# check current privilege is administrator or not
$runas = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if ( $runas ) {
	# Change group policy
        Set-ExecutionPolicy -Force RemoteSigned

	# Enable access from any host
        Set-Item -Force WSMan:\localhost\Client\TrustedHosts -Value *

	# Enable remote session
	Enable-PSRemoting -Force -SkipNetworkProfileCheck

} else {
        Write-Warning "should run as administrator"

}

