
#include <iostream>
#include <cstdio>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <stdlib.h>
#include <unistd.h>
using namespace std;

class Semaphore {
public:
	Semaphore();
	~Semaphore();
	int  P( );
	void V( );
	int  Z( );
	void Put( const int );
	int  Get( );
	struct sembuf zero,lock, unlock;
	
private:
	union semun {
	int val;
	struct semid_ds *buf;
	unsigned short int *array;
	struct seminfo *__buf;
	};
	union  semun  arg;
	//struct sembuf zero,lock, unlock;
	int   semid;
	pid_t my_pid;
	
};

