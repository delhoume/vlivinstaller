VERSION=2.5.6
VERSIONSHORT=256

NSIS  = "c:\program files (x86)\nsis\makensis.exe"
NSISFLAGS = /DVERSION=$(VERSION) /V4 /DVERSIONSHORT=$(VERSIONSHORT)


all: vliv$(VERSIONSHORT).exe 

vliv$(VERSIONSHORT).exe: vlivmui.nsi
	$(NSIS) $(NSISFLAGS) vlivmui.nsi

clean:
	del *.dll *.exe *.zip *~ 