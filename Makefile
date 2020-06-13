CC = gcc
CFLAGS = -I/usr/include/ffmpeg -fPIC -ffast-math -fvisibility=hidden -DSWITCH_API_VISIBILITY=1 -DCJSON_API_VISIBILITY=1 -DHAVE_VISIBILITY=1  -I/usr/include/uuid -std=c99 -g -O2 -pedantic
LDFLAGS = -Wl,-rpath,/usr/lib64/freeswitch/mod -Wl,--no-undefined -lm -lz -Wl,-z,relro
LIBS = -lavcodec -lavformat -lswscale -lswresample -lavutil -lfreeswitch

OBJS = avcodec.o avformat.o mod_av.o


all: mod_av.so

mod_av.so: $(OBJS)
	gcc -shared -o $@ $(OBJS)  $(LIBS) $(LDFLAGS)

clean:
	rm -f mod_av.so *.o


install:
	install -m 0755 -D mod_av.so $(DESTDIR)/usr/lib64/freeswitch/mod/mod_av.so

.PHONY: clean
