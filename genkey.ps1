#!/usr/local/bin/powershell

param (
    [string]$FileName,
    [switch]$Force
)

if (-not $FileName){
    Write-Error "You must provide a Filename for the Key"
	exit 1
}

$BaseDir="$HOME/.ssh"
$KeyPath = "$BaseDir/$FileName"

Write-Output "Generating Key $FileName under $BaseDir"

if (Test-Path $KeyPath) {
    Write-Error "$FileName Already exists under $BaseDir"
	exit 1
}

if (Test-Path "$KeyPath.pub") {

    if($Force){
        Remove-Item "$basedir/$FileName.pub"
        Write-Output "Lone Public key was Removed"
    } else{
        Write-Output "$FileName Doesn't exist but its Public key does."
        exit 1
    }
}

ssh-keygen -b 4096 -t rsa -C "git@cebbinghaus.com" -q -f "$KeyPath" -N '""'
