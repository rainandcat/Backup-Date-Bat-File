@echo off

REM 可以使用%date%顯示全部系統日期，也會包含顯示星期
REM echo 你的日期格式是"%date%"(這段記得加在判斷式前面)

REM 判斷日期格式和顯示
if %date:~2,1% equ / goto mmddyyyy
if %date:~2,1% equ - goto mmddyyyy
goto yyyymmdd

:mmddyyyy
set YYYY=%date:~6,4%
set MM=%date:~0,2%
set DD=%date:~3,2%

if %date:~2,1% equ / ( echo 你的日期格式是"%YYYY%/%MM%/%DD%"
) else ( echo 你的日期格式是"%YYYY%-%MM%-%DD%" )
goto checkmd

:yyyymmdd
set YYYY=%date:~0,4%
set MM=%date:~5,2%
set DD=%date:~8,2%

if %date:~4,1% equ / ( echo 你的日期格式是"%YYYY%/%MM%/%DD%"
) else ( echo 你的日期格式是"%YYYY%-%MM%-%DD%" )

:checkmd
set /p var=要幫你建立資料夾嗎?(y/n):

IF %var% EQU y ( echo 正在幫你建立 ^^_^^ 
) else if %var% EQU Y ( echo 正在幫你建立 ^^_^^ 
) else if %var% EQU N ( echo 下次見~Bye~  
pause 
goto :eof ) else if %var% EQU n ( echo 下次見~Bye~ 
pause 
goto :eof ) else ( echo 輸入y/n好嗎~我森氣氣了~掰掰
pause 
goto :eof)

REM 將月、日的十位數為0時去除第一碼的0
if %MM:~0,1% == 0 ( set /A MM=%MM:~1,1%+0 ) else ( set /A MM=%MM%+0 )
if %DD:~0,1% == 0 ( set /A DD=%DD:~1,1%+0 ) else ( set /A DD=%DD%+0 )

REM 取得目前路徑
set TargetPath=%cd%

REM 依今日日期建立備份目錄，並將source folder複製一份到BackupFolder
REM 將數字月份轉換成英文月份
IF %MM% EQU 1 (set Change_MM=Jan)
IF %MM% EQU 2 (set Change_MM=Feb)
IF %MM% EQU 3 (set Change_MM=Mar)
IF %MM% EQU 4 (set Change_MM=Apr)
IF %MM% EQU 5 (set Change_MM=May)
IF %MM% EQU 6 (set Change_MM=Jun)
IF %MM% EQU 7 (set Change_MM=Jul)
IF %MM% EQU 8 (set Change_MM=Aug)
IF %MM% EQU 9 (set Change_MM=Sep)
IF %MM% EQU 10 (set Change_MM=Oct)
IF %MM% EQU 11 (set Change_MM=Nov)
IF %MM% EQU 12 (set Change_MM=Dec)
REM 上方這段看個人喜好，如不需要可以拿下，但下方%Change_MM%記得改成%MM%


REM 將備份資料指向想要的位置
set BackupFolder=C:\%YYYY%-%Change_MM%-%DD%
echo md %BackupFolder%
md %BackupFolder%

REM 最後做xcopy，將資料夾裡面東西全部複製
echo xcopy %TargetPath%\. %BackupFolder%\ /D /E
xcopy %TargetPath%\*.* %BackupFolder%\*.* /D /E

echo 做完囉~~你可以檢查看看~~下次見~~~

pause

