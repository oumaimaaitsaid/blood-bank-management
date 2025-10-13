@echo off
setlocal

set TOMCAT_PATH=C:\apache-tomcat-9.0.110-windows-x64\apache-tomcat-9.0.110
set CATALINA_HOME=%TOMCAT_PATH%

echo 🛑 Stopping Tomcat if running...
call "%TOMCAT_PATH%\bin\shutdown.bat"
timeout /t 5 /nobreak >nul

echo 🔧 Building project...
call mvn clean package

echo 🚀 Deploying WAR file...
copy target\blood-bank-management-1.0-SNAPSHOT.war "%TOMCAT_PATH%\webapps\" /Y

echo ▶️ Starting Tomcat...
start "" cmd /c "%TOMCAT_PATH%\bin\startup.bat"

timeout /t 10 /nobreak >nul
start http://localhost:8080/blood-bank-management-1.0-SNAPSHOT/

echo ✅ Done.
pause
endlocal
