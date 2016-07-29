C:\WIN\ESSCFG.EXE /A:220 /I:5 /D:1 /B:330 /M:E
@rem C:\WIN\ESSCFG.EXE /A:220 /I:10 /D:0 /B:330 /M:E
C:\WIN\ESSVOL.EXE /V:8 /L:8 /W:8 /M:0 /C:8 /S:8 /A:8
@rem SET PATH=C:\WIN\SYSTEM\WBEM;%PATH%
SET PATH=%PATH%;c:\kit\unix\usr\local\wbin\;c:\vc;c:\dosidle\v0200
set BLASTER=A220 I5 D1 T1 P330 H5
set sound=c:\win
lh ctmouse.exe
rem set pc speaker volume (aka auxb) so it works after having started win98 once
cd vc
rem detects audiodrive differently if ran from same dir where essvol.exe exists!
essvol /a:8
cd \
@rem if defined runwin (
set
@rem if "%runwin%" == "1"
@rem parens wont work (  bad command or filename
@rem win
@rem win
@rem ) ELSE (
@rem echo skipping win
@rem )

choice /c:YN /tY,2 "Run Windows?"
if not errorlevel 2 win
if errorlevel 2 lh c:\dosidle\v0200\dosidle.exe
rem dosidle v210 locks up due to emm386 if errorlevel 2 c:\dosidle\dosidle.exe
rem dosidle v200 works tho!

vc

