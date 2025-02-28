@echo  off
REM setting working directory to location of .bat file
cd /d "%~dp0"
echo set directory as: %CD%
REM allows printing of current folder as project folder 
for %%I in (%CD%) do set "ProjectFolder=%%~nxI"

REM setting up a confirmation dialogue box
echo.
echo This script will create a PY project folder under the name %ProjectFolder% with the directory: %CD%. & echo. & echo Are you sure you wish to proceed? (Y/N):
REM allows for user input under variable name confirm
:REPROMPT
SET /P confirm=
IF /I "%confirm%"=="Y" GOTO RUN
IF /I "%confirm%"=="N" GOTO ABORT
REM in the event of misinput will reprompt 
echo Invalid input. Please enter Y or N.
GOTO REPROMPT

REM moving to desired code block using labels
REM cancel project folder initialisation 
:ABORT
echo. & echo Project folder initialisation has been aborted & echo.
GOTO END

REM confirm and initialise project folder
:RUN
echo initialising UV project
uv init --no-workspace 

echo making and populating .vscode directory
mkdir .vscode
cd .vscode 
REM creating populated settings.json file
(
echo {
echo     "workbench.colorTheme": "Kimbie Dark",
echo.
echo     "workbench.colorCustomizations": {
echo         "titleBar.activeBackground": "#ffead3",
echo 		 "titleBar.activeForeground": "#000000" 
echo     },
echo.
echo     "python.analysis.extraPaths": [
echo         "${workspaceFolder}/src"
echo     ]
echo }
) > settings.json
type nul > extensions.json
cd ..

echo making and populating src directory
mkdir src
move hello.py src/main.py

REM adding packages 
echo.
echo If no packages are desired, leave blank. Packages can be added with uv add "packagename" at any time.
set /P packages=Please enter desired package names (comma or space-seperated): 
if "%packages%"=="" (
	echo No packages slected. Skipping package installation...
) else (
	set packages=%packages:,= %
	for %%p in (%packages%) do (
		echo.
		echo Installing %%p...
		echo.
		uv add %%p 
		echo.
	)
echo finished installing %packages%
)
echo opening project folder in vscode
start code .
GOTO END

REM keeps cmd open after conculsion of script operation 
:END
echo Press any key to close...
pause >nul