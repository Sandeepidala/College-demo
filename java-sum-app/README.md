# Java Sum App

A minimal Java project that reads two numbers and prints their sum.

## What it does
- Accepts two numbers as command-line arguments: `java -cp bin com.example.sumsum.SumApp 3 4`
- If no arguments are provided, it prompts the user to enter two numbers interactively.

## Prerequisites
- Java Development Kit (JDK) 8+ installed and `javac`/`java` available in PATH
- PowerShell for the build/run scripts (Windows)

## Build
From PowerShell, run:

```powershell
cd .\java-sum-app
.\build.ps1
```

If compilation succeeds, class files will be written under `java-sum-app/bin`.

## Run
Run the program using `run.ps1` or directly with `java`:

Interactive mode (prompts for numbers):

```powershell
cd .\java-sum-app
.\run.ps1
```

Run with command-line arguments (example):

```powershell
cd .\java-sum-app
.\run.ps1 5 7
```

Or directly (after building):

```powershell
cd .\java-sum-app
java -cp bin com.example.sumsum.SumApp 5 7
```

## Example
Input: 2 and 3
Output: `Sum: 5`

## File structure
- `src/main/java/com/example/sumsum/SumApp.java` — main Java source file
- `build.ps1` — compile script
- `run.ps1` — run script
- `bin/` — compiled classes (created by `build.ps1`)

Feel free to extend this example with a build tool (Maven/Gradle) if you prefer.

## Troubleshooting
- If you see errors like "'javac' not found in PATH" or "'java' not found in PATH", you need to install the JDK and add it to your PATH. On Windows, a quick way to install the Temurin JDK is:

```powershell
choco install temurin
```

Alternatively, download a JDK from https://adoptium.net/ and follow the installer instructions.

After installing, open a new PowerShell prompt and re-run the `build.ps1` and `run.ps1` scripts.
