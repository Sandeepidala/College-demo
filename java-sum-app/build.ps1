# Build script for Java Sum App
# Usage: .\build.ps1

$src = Join-Path -Path $PSScriptRoot -ChildPath 'src/main/java'
$bin = Join-Path -Path $PSScriptRoot -ChildPath 'bin'

if (-not (Test-Path $bin)) {
    New-Item -ItemType Directory -Path $bin | Out-Null
}

# Gather all Java files
$files = Get-ChildItem -Path $src -Recurse -Filter *.java | ForEach-Object { $_.FullName }

if ($files.Count -eq 0) {
    Write-Host "No Java source files found in $src"
    exit 1
}

# Compile
Write-Host "Compiling Java source files..."
# Check if javac is available
$javac = Get-Command javac -ErrorAction SilentlyContinue
if (-not $javac) {
    Write-Host "Error: 'javac' not found in PATH. Please install JDK and add 'javac' to PATH." -ForegroundColor Red
    exit 2
}

& $javac -d $bin $files
if ($LASTEXITCODE -ne 0) {
    Write-Host "Compilation failed"
    exit $LASTEXITCODE
}

Write-Host "Compilation succeeded. Classes written to $bin"

# End script
