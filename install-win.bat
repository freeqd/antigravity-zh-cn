@echo off
REM ========================================================
REM Antigravity 2.0 zh-Hant-TW package - install
REM ========================================================
title Antigravity 2.0 zh-Hant-TW - Install

echo.
echo ========================================================
echo   Antigravity 2.0 汉化安装工具
echo   Antigravity 2.0 zh-Hant-TW package
echo ========================================================
echo.

REM Check Node.js
echo [Precheck] Checking Node.js...
node -v >nul 2>nul
if errorlevel 1 (
    echo.
    echo [Error] Node.js is not available.
    echo   Install Node.js LTS from https://nodejs.org/
    echo   and make sure node is available in PATH.
    echo   If Access Denied appears, reinstall Node.js and check PATH.
    echo.
    pause
    exit /b 1
)

REM Check local @electron/asar
if not exist "%~dp0node_modules\@electron\asar\bin\asar.js" (
    echo.
    echo [Error] Local @electron/asar CLI was not found.
    echo   Run this in the package root first:
    echo     npm install
    echo   Then run this install script again.
    echo.
    pause
    exit /b 1
)

echo [Precheck] Node.js and asar CLI are ready.
echo.

REM ===== 选择汉化语言 =====
echo 请选择汉化语言 / Select localization language:
echo   [1] 简体中文（中国大陆）
echo   [2] 繁體中文（台灣）
echo.
set LANG_CHOICE=
set /p LANG_CHOICE=请输入数字并回车，默认 2 / Enter number (default 2): 
if "%LANG_CHOICE%"=="1" (
    set LANG_ARG=--lang zh-CN
) else (
    set LANG_ARG=--lang zh-TW
)

echo.
echo [1/3] Closing Antigravity processes...
taskkill /f /im Antigravity.exe /t >nul 2>nul
timeout /t 2 /nobreak >nul

echo.
echo [2/3] Applying localization...
node "%~dp0localization_engine.js" %LANG_ARG% %*

echo.
echo [3/3] Done.
echo.
echo [Note] Restart Antigravity manually to apply changes.
echo.
pause
