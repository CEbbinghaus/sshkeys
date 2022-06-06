#!/usr/local/bin/powershell

Write-Output "Generating Default Keyfiles..."

$keys=("github", "gitlab")

foreach($key in $keys){

     &"$HOME\.ssh\genkey.ps1" "$key" --Force
     
	if($?){
          Write-Output "Generated $key Key"
     }else{
          Write-Error "Failed to generate $key"
     }
}

Write-Output "Generating GPG key"

Write-Output @'
%no-protection
Key-Type: RSA
Key-Length: 4096
Subkey-Type: RSA
Subkey-Length: 4096
Name-Real: Christopher-Robin Ebbinghaus
Name-Email: git@cebbinghaus.com
Expire-Date: 0
'@ | Set-Content key -Encoding Ascii

gpg --batch --gen-key key *> $null

Write-Output "Finished Generating GPG Key"
Remove-Item key
