@echo off
:: UTF-8 is included, in case if the file has non-English characters 
chcp 65001 >nul 

:: Output file
set OUTPUT_FILE=compiled_output.txt
if exist %OUTPUT_FILE% del %OUTPUT_FILE%

:: Loop through files in the current directory and compite their content into the complited_output.txt 
for %%F in (*.*) do (
	if /I not "%%~nxF"=="%~nx0" if /I not "%%~nxF"=="%OUTPUT_FILE%" (
		echo  FILE: %%~nxF ->> "%OUTPUT_FILE%"
		type "%%F" >> "%OUTPUT_FILE%" 2>nul
		echo. >> "%OUTPUT_FILE%"
	)
)

@echo Done: all files contents has been copied to %OUTPUT_FILE%.