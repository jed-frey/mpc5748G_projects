@ECHO OFF
set PROJECT_ENV=%~dp0.env\
call %PROJECT_ENV%bootstrap_MinGW\bootstrap_MinGW.bat
call %PROJECT_ENV%bootstrap_CMake\bootstrap_WinPython.bat
call %PROJECT_ENV%bootstrap_CMake\bootstrap_CMake.bat
call %PROJECT_ENV%bootstrap_LLVM\bootstrap_LLVM.bat

cmd /k