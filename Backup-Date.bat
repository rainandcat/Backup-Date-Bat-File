@echo off

REM �i�H�ϥ�%date%��ܥ����t�Τ���A�]�|�]�t��ܬP��
REM echo �A������榡�O"%date%"(�o�q�O�o�[�b�P�_���e��)

REM �P�_����榡�M���
if %date:~2,1% equ / goto mmddyyyy
if %date:~2,1% equ - goto mmddyyyy
goto yyyymmdd

:mmddyyyy
set YYYY=%date:~6,4%
set MM=%date:~0,2%
set DD=%date:~3,2%

if %date:~2,1% equ / ( echo �A������榡�O"%YYYY%/%MM%/%DD%"
) else ( echo �A������榡�O"%YYYY%-%MM%-%DD%" )
goto checkmd

:yyyymmdd
set YYYY=%date:~0,4%
set MM=%date:~5,2%
set DD=%date:~8,2%

if %date:~4,1% equ / ( echo �A������榡�O"%YYYY%/%MM%/%DD%"
) else ( echo �A������榡�O"%YYYY%-%MM%-%DD%" )

:checkmd
set /p var=�n���A�إ߸�Ƨ���?(y/n):

if %var% EQU y ( echo ���b���A�إ� ^^_^^ 
) else if %var% EQU Y ( echo ���b���A�إ� ^^_^^ 
) else if %var% EQU N ( echo �U����~Bye~  
pause 
goto :eof ) else if %var% EQU n ( echo �U����~Bye~ 
pause 
goto :eof ) else ( echo ��Jy/n�n��~�ڴˮ��F~�T�T
pause 
goto :eof)

REM �N��B�骺�̦�Ƭ�0�ɥh���Ĥ@�X��0
if %MM:~0,1% == 0 ( set /A MM=%MM:~1,1%+0 ) else ( set /A MM=%MM%+0 )
if %DD:~0,1% == 0 ( set /A DD=%DD:~1,1%+0 ) else ( set /A DD=%DD%+0 )

REM ���o�ثe���|
set Target_Path=%cd%

REM �̤������إ߳ƥ��ؿ��A�ñNsource folder�ƻs�@����BackupFolder
REM �N�Ʀr����ഫ���^����
if %MM% EQU 1 (set Change_MM=Jan)
if %MM% EQU 2 (set Change_MM=Feb)
if %MM% EQU 3 (set Change_MM=Mar)
if %MM% EQU 4 (set Change_MM=Apr)
if %MM% EQU 5 (set Change_MM=May)
if %MM% EQU 6 (set Change_MM=Jun)
if %MM% EQU 7 (set Change_MM=Jul)
if %MM% EQU 8 (set Change_MM=Aug)
if %MM% EQU 9 (set Change_MM=Sep)
if %MM% EQU 10 (set Change_MM=Oct)
if %MM% EQU 11 (set Change_MM=Nov)
if %MM% EQU 12 (set Change_MM=Dec)
REM �W��o�q�ݭӤH�ߦn�A�p���ݭn�i�H���U�A���U��%Change_MM%�O�o�令%MM%


REM �N�ƥ���ƫ��V�Q�n����m
set Backup_Folder=C:\%YYYY%-%Change_MM%-%DD%
echo md %Backup_Folder%
md %Backup_Folder%

REM �̫ᰵxcopy�A�N��Ƨ��̭��F������ƻs
echo xcopy %Target_Path%\. %Backup_Folder%\ /D /E
xcopy %Target_Path%\*.* %Backup_Folder%\*.* /D /E

echo �����o~~�A�i�H�ˬd�ݬ�~~�U����~~~

pause

