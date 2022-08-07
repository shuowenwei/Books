
/*
	Header file for the TCPSocket
*/
#include <iostream>
#include <unistd.h>       
#include <cstdio>
#include <stdlib.h>
#include <string.h>
#include<sys/socket.h>
#include <arpa/inet.h>
#include <netdb.h>

#define MAX_PENDING 10
#define BUFFSIZE 9999
using namespace std;

class TCPSocket
{
	private:
		//int sock; //Socket descriptor
		struct sockaddr_in ipAddr; //Socket Address
		bool isSocketClose; //Flag to validate the socket
		int nodeNumber;

	public:
	int sock;	
		TCPSocket();
		~TCPSocket();
		void createSocket();
		string address();
		int port();
		void close();
		bool connect(char * address,int port);
		bool bind(int port);
		bool listen(int maxPending = 0);
		TCPSocket accept(TCPSocket&);
		TCPSocket& operator << (char * );
  		TCPSocket& operator >> (char * );		
		void inValidate() ;
		int send(char *,int );
		int recv(char *,int );
		void  setNode(int i);
		int getNode();
		
			
};
