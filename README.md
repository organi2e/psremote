# What's this
A set of script to remote script execution with powershell  

# Usage
Run `enable.ps1` on the remote machine at first to enable remote access  
Fill the undeterminant item (such as host name) and run the `test.bat`,  
and the `test.ps1` will be transferred and executed.  

# Why transfer and run (not apply `scriptblock`)
Several assets and binaries are required for almost cases although just one script is required for execution in this case.  
Transfer all of items and execute for that. 
