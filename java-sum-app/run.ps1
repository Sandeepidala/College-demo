# Run script for Java Sum App
# Usage:
#   .\run.ps1              -> prompts for input interactively
#   .\run.ps1 5 3         -> runs with command line args (first=5, second=3)

$bin = Join-Path -Path $PSScriptRoot -ChildPath 'bin'
$class = 'com.example.sumsum.SumApp'

if (-not (Test-Path $bin)) {
    Write-Host "Binary directory not found. Run .\build.ps1 first to compile."
    exit 1
}

$java = Get-Command java -ErrorAction SilentlyContinue
if (-not $java) {
    Write-Host "Error: 'java' not found in PATH. Please install JDK and add 'java' to PATH." -ForegroundColor Red
    exit 2
}
$argList = @()
if ($args.Count -gt 0) {
    $argList = $args
}

& $java -cp $bin $class $argList
