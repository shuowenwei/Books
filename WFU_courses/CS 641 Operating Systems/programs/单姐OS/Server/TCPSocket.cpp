
#include "tcpSock.h"

/*
 Create TCPSocket Object
*/	
TCPSocket::TCPSocket(){
	isSocketClose = false;
	sock = -1;
}

/*
	Destructor closes the socket
*/
TCPSocket::~TCPSocket(){
	if(isSocketClose) {
		cout<<"in destructor"<<endl;
		::close(sock);
	}
	
}

/*
	This function creates a new socket.Returns
	true if a new socket is created	
*/
void TCPSocket::createSocket(){
	
	if((sock = socket(PF_INET, SOCK_STREAM,IPPROTO_TCP)) == -1){
		cerr << "Could not create socket \n"; 
		exit(1);	
	}
}

/*
	This function returns the IP address of the remote host
*/
string TCPSocket::address(){
	return string(inet_ntoa(ipAddr.sin_addr));
}

/*
	This function receives the client's IP address and the port and connects the socket
	to the client.

*/
bool TCPSocket::connect(char* address, int port){
	//Address Family
	ipAddr.sin_family = AF_INET; 
	
	//port address
	ipAddr.sin_port = htons(port); 

	//internet address
	ipAddr.sin_addr.s_addr = inet_addr(address);
	memset( &(ipAddr.sin_zero), '\0', 8);
	if(::connect(sock, (struct sockaddr *) &ipAddr,sizeof(struct sockaddr)) < 0){		
		return false;
	}
	return true;
}

/*
	This function used to bind the socket to the local address and the port.
*/
bool TCPSocket:: bind(int port){
	ipAddr.sin_family = AF_INET;        	
	ipAddr.sin_port = htons(port);
	ipAddr.sin_addr.s_addr = INADDR_ANY; 
	memset( &(ipAddr.sin_zero), '\0', 8);
	if(::bind(sock, (struct sockaddr*) &ipAddr,sizeof(struct sockaddr)) == -1){		
		return false;  
	}
	else
		return true;

}

/*
	Server listens to the for the client requesting connection.
*/
bool TCPSocket::listen(int maxPending){
	if(::listen(sock,MAX_PENDING) < 0){
		cerr << "Could not listen to socket \n"; 
		return false;
	}
	else
		return true;
}

/*
	closes the socket
*/
void TCPSocket:: close(){
	::close(sock);
}

/*
	Returns the port address
*/
int TCPSocket::port(){
	return ipAddr.sin_port;
}

/*
	Server accepts a connection and returns a TCPSocket for the client to send and
	receive the message
*/
TCPSocket TCPSocket::accept(TCPSocket &cliSock){
	
	unsigned int addrLength = sizeof ( struct sockaddr_in);
	if ((cliSock.sock = ::accept(sock, ( struct sockaddr *)&cliSock.ipAddr, &addrLength)) < 0){
		cerr << "Could not accept connection \n";
		TCPSocket tcpSock;
		return tcpSock;
		
	}
	return cliSock;
}

/*
	Overloadeded function that sends a message to the socket
*/
TCPSocket& TCPSocket::operator << (char* message ){
	if(::send(sock, message, strlen(message) + 1, 0) == -1){
		cerr << "Could not send to socket \n"; 
		exit(2);  
	}
	return *this;
}

/*
	Overloadeded function that receives a message from the socket
*/
TCPSocket& TCPSocket::operator >>(char* message ){ 
	char buffer[256];      
	int x;
	if( (::recv(sock, message, BUFFSIZE, 0) ) == -1){  
		cerr << "Could not receive from socket \n"; 	
		exit(3);	 
	}
	return *this;
}

/*
	Function to invalidate the socket that is not needed anymore
*/
void TCPSocket:: inValidate(){	
	isSocketClose = true;
}


int TCPSocket:: send(char *buffer,int size){
	int bytesSent;
	bytesSent = ::send(sock, buffer, size, 0);
	cout<<"sock "<<sock<<endl;
	//cerr<<"error"<<endl;
	if( bytesSent == -1){
		cerr << "Could not send data to server \n"; 
		exit(4);  
	}
	return bytesSent;
}

int TCPSocket:: recv(char *buffer ,int maxSize){
	int byteRecv;
	byteRecv = ::recv(sock, buffer, maxSize, 0);
	if( byteRecv == -1){  
		cerr << "Could not receive data from server \n"; 	
		exit(5);	 
	}
	return byteRecv;
}

//Set node number

void  TCPSocket::setNode(int i){
	nodeNumber = i;
}

int TCPSocket::getNode(){
	return nodeNumber;
}

