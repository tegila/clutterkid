CLUTTER_CFLAGS = -pthread -I/usr/local/include/clutter-0.9 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/include/gtk-2.0 -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12 -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/drm -I/usr/lib64/gtk-2.0/include -I/usr/include/atk-1.0
CLUTTER_LIBS = -pthread -L/usr/local/lib -lclutter-gtk-0.9 -lclutter-glx-0.9 -lgtk-x11-2.0 -lgthread-2.0 -lrt -lGL -lX11 -lXext -lXdamage -lXcomposite -lXi -lXfixes -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lglib-2.0
CC = gcc 
CFLAGS = -c -Wall $(CLUTTER_CFLAGS) # @TODO: CLUTTER_CFLAGS=`pkg-config --cflags clutter-0.9`
LINKER = gcc
LDFLAGS = $(CLUTTER_LIBS) -o # @TODO: CLUTTER_LIBS=`pkg-config --libs clutter-0.9`
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
