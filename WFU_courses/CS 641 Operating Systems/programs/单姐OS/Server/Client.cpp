#include "client.h"
using namespace std;

/*
	Client program that connects the client to the server.
	and send and receive the message from the server.
*/

int parse(string);
void getNumbers(char *msg,char *numbers[]);
void enterCriticalSection(char [],char *);
void processRequest(char [],TCPSocket);
void processReply();

void sigint_Handler(int signal){
	exit(1);
}

int main(int argc, char *argv[]){
	//static int ix = 0;
	int nodeNo;
	int status ;
	bool flag = true;
	char sendMessage[BUFFSIZE],recvMessage[BUFFSIZE];
	char request_message[BUFFSIZE];	
	TCPSocket sock ;
	int pid;
	char buff[20],temp[30];
	char addr[128];
	
	if(argc != 3){
		cerr<<"Usage : ./client server_ip portaddress"<<endl;
		exit(1);
	}		
	strcpy(serverIP,argv[1]);
	serverPort = atoi(argv[2]);
	//shared memory
	key = 1111;
	if((me_id = shmget(key,SHMSZ,IPC_CREAT|0666)) <0){
		perror("error in shmget");
		exit(1);
	}
	
	if((s_me = (int*)shmat(me_id,0,0)) == (int *)-1){
		perror("error in shmat");
	}
	*s_me = me;
	
	key = 222;
	if((seq_no_id = shmget(key,SHMSZ,IPC_CREAT|0666)) <0){
		perror("error in seq_no shmget");
		exit(1);
	}
	if((s_seq_no =(int *) shmat(seq_no_id,0,0)) == (int *)-1){
		perror("error in seq_no_shmat");
	}
	*s_seq_no = sequence_number; 

	key = 333;
	if((high_seq_no_id = shmget(key,SHMSZ,IPC_CREAT|0666)) <0){
		perror("error in high_seq_no_shmget");
		exit(1);
	}
	if((s_high_seq_no = (int*)shmat(high_seq_no_id,0,0)) == (int *)-1){
		perror("error in high_seq_no_shmat");
	}
	highest_request_number = 0;
	*s_high_seq_no = highest_request_number;

	key = 444;
	if((osr_id = shmget(key,SHMSZ,IPC_CREAT|0666)) <0){
		perror("error in osr_shmget");
		exit(1);
	}
	if((s_osr =(int*)shmat(osr_id,0,0)) == (int *)-1){
		perror("error in osr_shmat");
	}
	*s_osr = outstanding_reply;
	
	key = 555;
	if((req_cs_id = shmget(key,SHMSZ,IPC_CREAT|0666)) <0){
		perror("error in req_cs_shmget");
		exit(1);
	}
	if((s_req_cs = (bool*)shmat(req_cs_id,0,0)) == (bool *)-1){
		perror("error in req_cs_shmat");
	}
	*s_req_cs = request_CS;

	key = 666;
	if((reply_def_id = shmget(key,100*sizeof(bool),IPC_CREAT|0666)) <0){
		perror("error in reply_def_shmget");
		exit(1);
	}
	if((s_reply_def = (bool*)shmat(reply_def_id,0,0)) == (bool *)-1){
		perror("error in reply_def_shmat");
	}
	for(int i=0;i<100;i++){
		//reply_deferred[i]=false;
		s_reply_def[i]=false;
	}
	
	//*s_reply_def = reply_deferred[0];
	//s_reply_def = reply_deferred;
	
	key = 777;
	if((mutex_id = shmget(key,SHMSZ,IPC_CREAT|0666)) <0){
		perror("error in shmget");
		exit(1);
	}
	if((s_mutex = (Semaphore*)shmat(mutex_id,0,0)) == (Semaphore *)-1){
		perror("error in shmat");
	}
	mutex.Put(1);
	*s_mutex  = mutex;	
	
	key = 888;
	if((wait_sem_id = shmget(key,SHMSZ,IPC_CREAT|0666)) <0){
		perror("error in shmget");
		exit(1);
	}
	if((s_wait_sem = (Semaphore*)shmat(wait_sem_id,0,0)) == (Semaphore *)-1){
		perror("error in shmat");
	}
	wait_sem.Put(1);
	*s_wait_sem = wait_sem;

	char host[200];
	struct hostent *hostPtr;
	struct sockaddr_in inaddr;
	gethostname(host,sizeof(host));
	if((hostPtr = gethostbyname(host)) !=NULL){
		memcpy((char *)&inaddr.sin_addr,(char *)hostPtr->h_addr,
					sizeof(inaddr.sin_addr));
					
	}
	char *myIP = inet_ntoa(inaddr.sin_addr);
	string str(myIP);
	size_t found = str.find_last_of("."); 
	me = atoi(str.substr(found+1).c_str());
	*s_me = me;
	cout<<myIP<<endl;	
	
				
		pid = fork();
		if(pid == 0){	
			while(1){
			//cout<<"in child"<<endl;
				if(cin.getline(request_message,BUFFSIZE)!=NULL){
					if(strcmp(request_message ,"Request CS") == 0){
						enterCriticalSection(request_message,myIP);
						
					}
				
					else if((strcmp(request_message,"end") == 0) || 
							(strcmp(request_message,"END") == 0) ){
						cout<<"Client quits"<<endl;
						break;
					}
				}
			}
			
		}
		else{
			TCPSocket newSock;
			sock.createSocket();
			if(!sock.bind(portNo)){
				cerr<<"sock:could not bind to port\n";
				exit(2);
			}
			sock.listen();
			while(1){
				sock.accept(newSock);
				newSock>>recvMessage;
				if(strstr(recvMessage,"Request CS") != NULL){
					processRequest(recvMessage,newSock);
				}
				else if(strstr(recvMessage,"Reply") != NULL){
					processReply();
				}
			}
			waitpid(pid,&status,0);
		}
	
	
	
	shmdt( (int *) me_id );
	if ( shmctl(me_id, IPC_RMID, (struct shmid_ds *) 0) == -1 ){
		perror("could not remove shared memory");
		exit( 3 );
	}
	shmdt( (int *) s_me );
	if ( shmctl(me_id, IPC_RMID, (struct shmid_ds *) 0) == -1 ){
		perror("could not remove shared memory");
		exit( 3 );
	}
	
	
	shmdt( (int *) s_seq_no);
	if ( shmctl(seq_no_id, IPC_RMID, (struct shmid_ds *) 0) == -1 ){
		perror("could not remove shared memory");
		exit( 3 );
	}
	shmdt( (int *) s_high_seq_no);
	if ( shmctl(high_seq_no_id, IPC_RMID, (struct shmid_ds *) 0) == -1 ){
		perror("could not remove shared memory");
		exit( 3 );
	}
	
	shmdt( (int *) s_osr);
	if ( shmctl(osr_id, IPC_RMID, (struct shmid_ds *) 0) == -1 ){
		perror("could not remove shared memory");
		exit( 3 );
	}
	
	shmdt( (bool *) s_req_cs);
	if ( shmctl(req_cs_id, IPC_RMID, (struct shmid_ds *) 0) == -1 ){
		perror("could not remove shared memory");
		exit( 3 );
	}
	shmdt( (int *) s_reply_def);
	if ( shmctl(reply_def_id, IPC_RMID, (struct shmid_ds *) 0) == -1 ){
		perror("could not remove shared memory");
		exit( 3 );
	}
		
	shmdt( (Semaphore *) s_mutex);
	if ( shmctl(mutex_id, IPC_RMID, (struct shmid_ds *) 0) == -1 ){
		perror("could not remove shared memory");
		exit( 3 );
	}

	shmdt( (Semaphore *) s_wait_sem);
	if ( shmctl(wait_sem_id, IPC_RMID, (struct shmid_ds *) 0) == -1 ){
		perror("could not remove shared memory");
		exit( 3 );
	}
	return 0;
}

int parse(string address){
	int id;
	int index = address.find_last_of(".");
	id = atoi(address.substr(index+1).c_str());
	return id;
}

void getNumbers(char *msg,char *numbers[]){
	strtok(msg," ");
	numbers[0] = (char *)strtok(NULL," ");
	numbers[1] = (char *)strtok(NULL," ");
}

void enterCriticalSection(char request_message[BUFFSIZE],char* myIP){
	//cout<<"in enterCriticalsection"<<endl;
	int pid,status;
	char buffer[20];
	char cs_message[BUFFSIZE],reply_message[BUFFSIZE],recvMessage[BUFFSIZE];
	pid = fork();
	if(pid == 0){
		s_mutex->P();
			*s_req_cs = true;
			*s_seq_no = *s_high_seq_no + 1;			
		s_mutex->V();
		*s_osr = N-1;
		
		strcat(request_message," ");
		sprintf(buffer,"%d", *s_seq_no);
		strcat(request_message ,buffer);
		strcat(request_message," ");
		sprintf(buffer,"%d",*s_me);
		strcat(request_message,buffer);
		for(int i = 0 ;i < N;i++){
			if(strcmp(nodes[i].c_str(),myIP) != 0){
				TCPSocket sendReqSock ;
				sendReqSock.createSocket();
				if (!sendReqSock.connect((char*)nodes[i].c_str(),portNo) ){
					cerr << "Could not connect to the node "
						<<nodes[i]<<endl; 
					exit(2);
				}
				sendReqSock.send(request_message,strlen(request_message));
				sendReqSock.close();
			}
		}

		//now wait for replies
		while(*s_osr != 0){
			cout<<"before wait_sem OSR "<<*s_osr<<endl;
			s_wait_sem->P();
		}
		
		/*critical section starts*/		
		memset((&buffer),'\0',sizeof(buffer));
		strcpy(cs_message,"#######START OUTPUT FOR NODE");
		sprintf(buffer,"%d",*s_me);
		strcat(cs_message,buffer);
		strcat(cs_message,"#########");
		TCPSocket serverSocket;
		serverSocket.createSocket();
		if (!serverSocket.connect(serverIP,serverPort) ){
			cerr << "Could not connect to the server\n"; 
			return;
		}		
		serverSocket << cs_message;
		cout<<"entered critcal section"<<endl;
		cout<<"Please start sending message"<<endl;
		while(1){
			memset((&buffer),'\0',sizeof(buffer));
			if(cin.getline(cs_message,MESSAGESIZE) != NULL){
				sprintf(buffer,"%d",*s_me);
				strcat(buffer,cs_message);
				if(strcmp(cs_message,"end") == 0){
					//serverSocket << buffer;
					break;
				}
				else
					serverSocket << buffer;
			}
		}
		
		strcpy(cs_message,"--------END OUTPUT FOR NODE");
		sprintf(buffer,"%d",*s_me);
		strcat(cs_message,buffer);
		strcat(cs_message,"---------");
		serverSocket << cs_message;
		strcpy(cs_message,"end");
		serverSocket<<cs_message;
		serverSocket.close();
		//done with printing
		*s_req_cs = false;
		string ip ="10.105.251.";
		char nodestr[5];
		for(int i = 76;i < 80;i++){
			if(s_reply_def[i] == true ){
				ip ="10.105.251.";
				s_reply_def[i] = false;
				strcpy(reply_message,"Reply");
				TCPSocket replySoc;
				replySoc.createSocket();
				sprintf(nodestr,"%d",i);
				if (!replySoc.connect(
					(char*)ip.append(nodestr).c_str(),20000) ){
					cerr << "Could not connect to the node "
						<<ip.append(nodestr)<<endl; 
					exit(2);
				}
				replySoc<<reply_message;
				replySoc.close();
			}
			
		}
		
	}
	else{
		waitpid(pid,&status,0);
	}
}

void processRequest(char recvMessage[BUFFSIZE],TCPSocket replySoc){
	cout<<"in processrequest   "<<recvMessage<<endl;
	int pid,status;
	int k; //sequence no received
	int nodeNo;
	char *numbers[2]; 
	char message[MESSAGESIZE],buffer[20];;
	bool defer_it;
	pid = fork();
	if(pid == 0){
		getNumbers(strstr(recvMessage,"CS"),numbers);	
		k = atoi(numbers[0]);
		nodeNo = atoi(numbers[1]);
		//cout<<"k = "<<k<<" node no "<<nodeNo<<endl;
		if(k > *s_high_seq_no){
			*s_high_seq_no = k;
		}
		s_mutex->P();
		defer_it = (*s_req_cs) && ( (k >  *s_seq_no) || 
					  ((k ==  *s_seq_no) && (nodeNo > *s_me)) );
		s_mutex->V();
		// defer_it is true if we have priority
		string ip ="10.105.251.";
		char nodestr[5];
		if(defer_it){
			s_reply_def[nodeNo] = true;			
		}
		else{
			strcpy(message,"Reply ");
			replySoc.createSocket();
			sprintf(nodestr,"%d",nodeNo);
			if (!replySoc.connect(
				(char*)ip.append(nodestr).c_str(),20000) ){
				cerr << "Could not connect to the node "
					<<ip.append(nodestr)<<endl; 
				exit(2);
			}
			replySoc<<message;
			replySoc.close();
			
		}
		
	}
	else{
		waitpid(pid,&status,0);
	}
}

void processReply(){
	cout<<"in processreply"<<endl;
	int pid,status;
	pid = fork();
	if(pid == 0){
		*s_osr = *s_osr - 1;
		s_wait_sem->V();
	}
	else{
		waitpid(pid,&status,0);
	}
	
}


