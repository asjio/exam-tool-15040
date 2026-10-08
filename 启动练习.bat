@echo off
cd /d %~dp0
netstat -ano | findstr ":8899" | findstr "LISTENING" >nul
if %errorlevel%==0 (
  start http://127.0.0.1:8899
) else (
  start "" python -m http.server 8899
  timeout /t 2 /nobreak >nul
  start http://127.0.0.1:8899
)
