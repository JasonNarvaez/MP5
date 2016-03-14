# makefile

all: dataserver client

reqchannel.o: reqchannel.h reqchannel.cpp
	g++ -c -g reqchannel.cpp
	
semaphore.o: semaphore.h semaphore.cpp
	g++ -c -g semaphore.cpp
	
BoundedBuffer.o: BoundedBuffer.h BoundedBuffer.cpp
	g++ -c -g BoundedBuffer.cpp

dataserver: dataserver.cpp reqchannel.o 
	g++ -g -o dataserver dataserver.cpp reqchannel.o -lpthread

client: client.cpp reqchannel.o semaphore.o BoundedBuffer.o
	g++ -g -pthread -o client client.cpp reqchannel.o semaphore.o BoundedBuffer.o
