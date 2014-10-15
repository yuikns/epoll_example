#CC=clang++
CC=g++
CC_C=gcc
CFLAGS=-Wall -O3 --std=c++11
CFLAGS_C=-Wall -O3 --std=c99
LDFLAGS= -levent
OBJECTS=${SOURCES:.cc=.o} ${SOURCES:.c=.o}
DEL=rm -rf


SOURCES=cppeventc.cc cppevents.cc cevent.c
EXECCPPS=events
EXECCPPC=eventc
EXECC=events_c


CPPS=cppevents.o
CPPC=cppeventc.o
CS=cevent.o


EXECUTABLE:= ${EXECCPPS} ${EXECCPPC} ${EXECC}

.PHONY: all clean
all: $(SOURCES) $(EXECUTABLE)

${EXECCPPS}: ${OBJECTS}
	${CC} ${LDFLAGS} ${CPPS} -o $@

${EXECCPPC}: ${OBJECTS}
	${CC} ${LDFLAGS} ${CPPC} -o $@

${EXECC}: ${OBJECTS}
	${CC} ${LDFLAGS} ${CS} -o $@



.cc.o:
	${CC}  -c ${CFLAGS} $< -o $@

.c.o:
	${CC_C} -c  ${CFLAGS_C} $< -o $@

clean:
	-${DEL} *.o	
	-${DEL} ${EXECUTABLE}






