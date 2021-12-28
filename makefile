VERSION=2.5.3
VERSIONSHORT=253

SRCDIR = ..\vliv\src\

NSIS  = "c:\program files (x86)\nsis\makensis.exe"
NSISFLAGS = /DVERSION=$(VERSION) /DVERSIONSHORT=$(VERSIONSHORT)


all: vliv$(VERSIONSHORT).exe

vliv$(VERSIONSHORT).exe:
	$(NSIS) $(NSISFLAGS) vlivmui.nsi

clean:
	del *.dll *.exe *.zip *~ 