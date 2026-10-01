@echo off
rem ---------------------------------------------------------------------------
rem Тестовые прогоны заданий 2 и 3.
rem Использование: scripts\run_tests.bat   (сначала выполните scripts\build.bat)
rem Внимание: в строках echo нельзя использовать символ '>' - cmd считает его
rem перенаправлением вывода. Используйте '=' или слово "даёт".
rem ---------------------------------------------------------------------------
setlocal

set "ROOT=%~dp0.."
set "TASK2=%ROOT%\build\task2_bmi.exe"
set "TASK3=%ROOT%\build\task3_max_min.exe"

if not exist "%TASK2%" (
    echo [ERROR] %TASK2% not found. Run scripts\build.bat first.
    exit /b 1
)

echo ===================== TASK 2: BMI =====================
echo.
echo --- Test 1: mass 70, height 1.75 - BMI 22.86 (norm) ---
echo 70 1.75 | "%TASK2%"
echo.
echo --- Test 2: mass 30, height 1.60 - BMI 11.72 (deficit) ---
echo 30 1.60 | "%TASK2%"
echo.
echo --- Test 3: mass 95, height 1.90 - BMI 26.32 (overweight) ---
echo 95 1.90 | "%TASK2%"
echo.
echo --- Test 4 (error path): height 0 - must be rejected ---
echo 70 0 | "%TASK2%"

echo.
echo ================= TASK 3: max / min =================
echo.
echo --- Test 1: 3 7 -2   - max 7.00, min -2.00 ---
echo 3 7 -2 | "%TASK3%"
echo.
echo --- Test 2: 7 3 -2   - max 7.00, min -2.00 ---
echo 7 3 -2 | "%TASK3%"
echo.
echo --- Test 3: -2 5 3   - max 5.00, min -2.00 ---
echo -2 5 3 | "%TASK3%"
echo.
echo --- Test 4: 5 5 5    - all three are equal ---
echo 5 5 5 | "%TASK3%"
echo.
echo --- Test 5: -5 -5 -5 - all three are equal ---
echo -5 -5 -5 | "%TASK3%"

echo.
echo ========= FLOWCHART CHECK (task 1, see README) =========
echo Data set A: S = 30  - S less than 50 is true  - discount 0 percent  - total 30.00
echo Data set B: S = 75  - S less than 50 is false, S less than 100 true  - 5 percent  - total 71.25
echo Data set C: S = 150 - both conditions false - discount 10 percent - total 135.00
echo Full branch-by-branch trace - in README.md, section "Zadanie 1".
endlocal