@rem C:\WIN\ESSCFG.EXE /A:220 /D:1 /B:330 /M:E
@rem C:\WIN\ESSCFG.EXE /A:220 /I:7 /D:1 /B:330 /M:E
@rem set to irq 7 so it won't beep, should be 5 but says conflict; it is 5 in BIOS tho!
@rem C:\WIN\ESSCFG.EXE /A:220 /I:10 /D:0 /B:330 /M:E
rem ok i set irq 7 in BIOS, and irq 5 here
C:\WIN\ESSCFG.EXE /A:220 /I:5 /D:1 /B:330 /M:E
C:\WIN\ESSVOL.EXE /V:4 /L:8 /W:8 /M:0 /C:8 /S:8 /A:8
