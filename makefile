VERSION=2.5.7
VERSIONSHORT=257

NSIS  = "c:\program files (x86)\nsis\makensis.exe"
NSISFLAGS = /DVERSION=$(VERSION) /V4 /DVERSIONSHORT=$(VERSIONSHORT)


all: vliv$(VERSIONSHORT).exe 

vliv$(VERSIONSHORT).exe: vlivmui.nsi
	$(NSIS) $(NSISFLAGS) vlivmui.nsi

clean:
	del *.dll *.exe *.zip *~ 