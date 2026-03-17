@echo off
set DIR=%~dp0
rd /s /q "%DIR%Intermediate"
rd /s /q "%DIR%DerivedDataCache"
rd /s /q "%DIR%Binaries"
rd /s /q "%DIR%Saved"
del /f /q "TLE.sln"
@echo on
@echo Project Clear Finished. Recompile from IDE.
pause