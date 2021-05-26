
rem useage:
rem build  		//only build tcli 
rem build -a 		//build all
@echo off
set one=%1
if "%one%"=="-a" (mvn -f ..\java\pom.xml clean install) else (mvn -f ..\java\tcli\pom.xml clean install)
