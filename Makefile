#CC=clang++
CC=g++
CFLAGS=-Wall -O3 --std=c++11
LDFLAGS= -levent
OBJECTS=$(SOURCES:.cc=.o)
DEL=rm -rf

SOURCES= epolls.cc epollc.cc
EXECUTABLE=epolls epollc


.PHONY: all clean
all: $(SOURCES) $(EXECUTABLE)
	
$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cc.o:
	$(CC)  -c $(CFLAGS) $< -o $@


clean:
	-${DEL} *.o	
	-${DEL} ${EXECUTABLE}





