@echo off
echo ============================================
echo  Medical Shop Shipping Register - Setup
echo ============================================
echo.

:: Check Python
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not in PATH.
    echo Please install Python 3.11+ from https://python.org
    pause
    exit /b 1
)

:: Install dependencies
echo [1/3] Installing dependencies...
pip install reflex>=0.6.0 openpyxl>=3.1.0

:: Initialize Reflex (first time only)
echo.
echo [2/3] Initializing Reflex project...
call reflex init

:: Run the app
echo.
echo [3/3] Starting the application...
echo.
echo  Open your browser at: http://localhost:3000
echo  Press Ctrl+C to stop the server
echo.
call reflex run
