function Get-Theme_Override {
    $themePath = "$HOME\Documents\PowerShell\Themes\gruvbox.omp.json"
    & "$env:LOCALAPPDATA\Programs\oh-my-posh\bin\oh-my-posh.exe" init pwsh --config $themePath | Invoke-Expression
}
