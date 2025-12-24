# function Get-Theme_Override { 
# 	$themePath = "$HOME\Documents\PowerShell\Themes\gruvbox.omp.json"
# 	& "$env:LOCALAPPDATA\Programs\oh-my-posh\bin\oh-my-posh.exe" init pwsh --config $themePath | Invoke-Expression
# }

function Get-Theme_Override {
    $ENV:STARSHIP_CONFIG = "$HOME\Documents\starship\starship.toml"

    if (Get-Command starship -ErrorAction SilentlyContinue) {
        Invoke-Expression (&starship init powershell)
    }
}
