@echo off
rem ---------------------------------------------------------------------------
rem Сборка лабораторной работы №1, вариант 8 (MSVC, Visual Studio).
rem Использование: scripts\build.bat
rem ---------------------------------------------------------------------------
setlocal

set "ROOT=%~dp0.."
set "OUT=%ROOT%\build"

rem Подключаем переменные окружения Visual Studio (путь ищется автоматически).
set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
set "VSPATH="
if exist "%VSWHERE%" (
    for /f "usebackq tokens=*" %%i in (`"%VSWHERE%" -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do set "VSPATH=%%i"
)

if not defined VSPATH (
    echo [ERROR] Visual Studio with C++ components not found.
    echo Open "Developer Command Prompt for VS" and run the build again.
    exit /b 1
)

call "%VSPATH%\VC\Auxiliary\Build\vcvars64.bat" >nul
if errorlevel 1 (
    echo [ERROR] Failed to initialise the MSVC environment.
    exit /b 1
)

if not exist "%OUT%" mkdir "%OUT%"

echo Compiling task2_bmi.cpp ...
cl /nologo /EHsc /std:c++17 /W4 /utf-8 /Fo:"%OUT%\\" /Fe:"%OUT%\task2_bmi.exe" "%ROOT%\src\task2_bmi.cpp"
if errorlevel 1 exit /b 1

echo Compiling task3_max_min.cpp ...
cl /nologo /EHsc /std:c++17 /W4 /utf-8 /Fo:"%OUT%\\" /Fe:"%OUT%\task3_max_min.exe" "%ROOT%\src\task3_max_min.cpp"
if errorlevel 1 exit /b 1

echo.
echo [OK] Executables are in the build\ folder:
dir /b "%OUT%\*.exe"
endlocal