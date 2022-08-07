
#Makefile to compile the TCP Chat files

CC = g++



tcp:	Server.cpp Client.cpp  Hacker.cpp TCPSocket.o Semaphore.o 
	$(CC) -o server Server.cpp  TCPSocket.o 
	$(CC) -o client Client.cpp TCPSocket.o Semaphore.o 
	$(CC) -o hacker Hacker.cpp TCPSocket.o

TCPSocket.o: TCPSocket.cpp tcpSock.h
	$(CC) -c tcpSock.h
	$(CC) -c TCPSocket.cpp 

Semaphore.o: Semaphore.cpp Semaphore.h
	$(CC) -c Semaphore.cpp Semaphore.h

clean:
	\rm -f *.o tcp 
	
