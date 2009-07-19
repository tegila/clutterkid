# @READ: Alterar somente o caminho para o pkg-config (below)
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

CLUTTER_CFLAGS=`pkg-config --cflags clutter-0.9`
CLUTTER_LIBS=`pkg-config --libs clutter-0.9`

CC = gcc 
CFLAGS = -g -c -Wall $(CLUTTER_CFLAGS)
LINKER = gcc
LDFLAGS = $(CLUTTER_LIBS) -o
OBJS = first.o
TARGET = core

.IGNORE: 
.SILENT: 

$(TARGET): $(OBJS) 
	$(LINKER) $(LDFLAGS) $@ $(OBJS) 

.cc.o: 
	$(CC) $(CFLAGS) $< 

clean: 
	rm -f *.o core 

distclean: 
	make clean 
	rm -f $(TARGET) 

again: 
	make distclean 
	make $(TARGET)
