#include "tcpSock.h"

using namespace std;

/*
	Client program that connects the client to the server.
	and send and receive the message from the server.
*/
int main(int argc, char *argv[]){
	char  sendMessage[BUFFSIZE],recvMessage[BUFFSIZE];
	char buffer[BUFFSIZE];
	TCPSocket sock ;
	if(argc != 3){
		cerr<<"Usage : client server_ip portaddress"<<endl;
		exit(1);
	}
	
	sock.createSocket();
	if (!sock.connect(argv[1],atoi(argv[2])) ){
		cerr << "Could not connect to the server\n"; 
		exit(2);
	}		
	strcpy(buffer,"I am the hacker");
	sock << buffer;	
	
	return 0;
}
