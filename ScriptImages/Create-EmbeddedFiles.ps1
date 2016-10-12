# Create embeddedable files of all gifs in this directory. Copy this output into the script if you want them to be extracted.
$OutFile = 'EncodedFiles.ps1'
Get-ChildItem -Path .\ -Recurse -Filter "*.gif" | Foreach {
    $FileName = $_.Name
    #$NewFileName = $_.Name -replace '.gif','.txt'
    $VarName = '$decode_' + ($FileName -replace '.gif','')
    $Content = Get-Content -Path $_.Name -Encoding Byte
    
    $Base64 = [System.Convert]::ToBase64String($Content)
    $NewContent = $VarName +  '= "' + $Base64 + '"'
    $NewContent | Out-File $OutFile -Append
}
