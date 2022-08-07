#include "tcpSock.h"
#include <signal.h>
using namespace std;


void sigint_Handler(int signal){
	exit(1);
}
int main(int argc, char *argv[]){

	string clientAddress;
	char recvMessage[BUFFSIZE],sendMessage[BUFFSIZE];
	char buffer[BUFFSIZE];
	TCPSocket sock ;
	TCPSocket clientSock;
	signal(SIGINT,sigint_Handler);
	if(argc != 2){
		cerr<<"Usage : ./server portaddress"<<endl;
		exit(1);
	}
	sock.createSocket();
	if(!sock.bind(atoi(argv[1])) ){
		cerr << "Could not bind to port \n"; 
		exit(2);
	}
	cout<<">";
	while(1){
		sock.listen(MAX_PENDING);	
		sock.accept(clientSock);
		cout<<"New client connected to the Server"<<endl;
		clientAddress =  clientSock.address();
		for(;;){
			clientSock >> recvMessage;
			if((strstr(recvMessage,"end") != NULL) || 
					(strstr(recvMessage,"END") != NULL) ){				
				break;
			}
			cout<<recvMessage<<endl;
			if(strstr(recvMessage,"hack") != NULL) {
				break;
			}
			memset(&(recvMessage),'\0',sizeof(recvMessage));
		}
	}
	return 0;
}
