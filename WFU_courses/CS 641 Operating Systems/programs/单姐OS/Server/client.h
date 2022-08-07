#include <sys/wait.h>
#include <sys/shm.h>
#include <stdlib.h>
#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <netdb.h>
#include <ctype.h>
#include "tcpSock.h"
#include "Semaphore.h"

#include <unistd.h>

//#define me
#define SHMSZ 200
#define REQUEST 0
#define N 4 //no of nodes in the network
#define MESSAGESIZE 50
using namespace std;
	int portNo = 20000;
	char serverIP[15];
	int serverPort;
	//shared variables
	int me;
	int sequence_number,highest_request_number = 0,outstanding_reply;
	bool request_CS,reply_deferred[100];
	Semaphore mutex;
	Semaphore wait_sem;
	//end shared variables
	key_t key ;
	int me_id;int *s_me;
	int seq_no_id;
	int* s_seq_no;
	int high_seq_no_id;
	int* s_high_seq_no;
	int osr_id;
	int* s_osr;
	int req_cs_id;
	bool* s_req_cs;
	int reply_def_id;
	bool* s_reply_def;
	int mutex_id;
	Semaphore* s_mutex;
	int wait_sem_id;
	Semaphore* s_wait_sem;
	string nodes[4] ={"10.105.251.76","10.105.251.77","10.105.251.78","10.105.251.79"};
	string nodeNos[4]={"76","77","78","79"};
