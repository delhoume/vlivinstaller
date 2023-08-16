VERSION=2.7.0
VERSIONSHORT=270_64

NSIS  = "c:\program files (x86)\nsis\makensis.exe"
NSISFLAGS = /DVERSION=$(VERSION) /V4 /DVERSIONSHORT=$(VERSIONSHORT)


all: vliv$(VERSIONSHORT)_64.exe 

vliv$(VERSIONSHORT)_64.exe: vlivmui.nsi
	$(NSIS) $(NSISFLAGS) vlivmui.nsi

clean:
	del *.dll *.exe *.zip *~ 