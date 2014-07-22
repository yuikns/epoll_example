#CC=clang++
CC=g++
CFLAGS=-Wall -O3 --std=c++11
LDFLAGS= -levent
OBJECTS=$(SOURCES:.cc=.o)
DEL=rm -rf


SOURCES= epolls.cc epollc.cc
EXECS=epolls
EXECC=epollc


OBJS=epolls.o
OBJC=epollc.o


EXECUTABLE:= ${EXECS} ${EXECC}

.PHONY: all clean
all: $(SOURCES) $(EXECUTABLE)
	
$(EXECS): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJS) -o $@

$(EXECC): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJC) -o $@


.cc.o:
	$(CC)  -c $(CFLAGS) $< -o $@


clean:
	-${DEL} *.o	
	-${DEL} ${EXECS} ${EXECC}






