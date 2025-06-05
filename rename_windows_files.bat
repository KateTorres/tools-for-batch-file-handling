@echo off
:: UTF-8 is included, in case if the file has non-English characters 
chcp 65001 >nul 

:: Enable advanced variable processing so that they can be read in live mode
setlocal EnableDelayedExpansion

:: Replace ___ with the phrase or characters to be batch-removed from all files in the current directories 
set "PATTERN=___"

:: Save current file into a variable amd loop through files in the current directory 
for %%f in (*%PATTERN%*) do (
	set "oldname=%%f"
	set "newname=!oldname:%PATTERN%=!"
	ren "%%f" "!newname!"
)

@echo Done renaming files.