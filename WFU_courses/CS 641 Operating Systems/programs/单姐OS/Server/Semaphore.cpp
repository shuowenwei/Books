#include "Semaphore.h"
					 // Generate a private semaphore
Semaphore::Semaphore(){
	int key = 1234;
	zero.sem_num   = 0, zero.sem_op   =  0, zero.sem_flg   = SEM_UNDO;
	lock.sem_num   = 0, lock.sem_op   = -1, lock.sem_flg   = SEM_UNDO;
	unlock.sem_num = 0, unlock.sem_op =  1, unlock.sem_flg = SEM_UNDO;
	my_pid = getpid( );
	if((semid = semget( IPC_PRIVATE, 1, 0660 )) == -1 ){
	//if((semid = semget( key,3,IPC_CREAT | 0660 )) == -1 ){
		perror("Error in creating semaphore");
		exit( 1 );
	}
	Put( 0 );                           // Default - set to zero @ start
}
 // Remove semaphore if creator
Semaphore::~Semaphore( ) {
	
	if ( getpid( ) == my_pid )
	if ( semctl( semid, 0, IPC_RMID ) == -1 )
	exit( 2 );
}
// LOCK semaphore
int Semaphore::P(){
	
	if ( semop( semid, &lock, 1 ) == -1 )
	exit( 3 );
	return 0;
}
// UNLOCK semaphore
void Semaphore::V( ){
	cout<<"in V unlock "<<endl;
	if ( semop( semid, &unlock, 1 ) == -1 )
	exit( 4 );
}

// Wait for semaphore to be 0
int Semaphore::Z( ){
	if ( semop( semid, &zero, 1 ) == -1 )
	exit( 5 );
	return 0;
}
// Assign value to the semaphore
void Semaphore::Put( int const value ){
	arg.val = value;
	if ( semctl(semid, 0, SETVAL, arg ) == -1 )
	exit( 6 );
}

// Return value of the semaphore
int Semaphore::Get( ){
	int sem_value;
	if ((sem_value=semctl(semid, 0, GETVAL, 0)) == -1 )
	exit( 7 );
	return sem_value;
}
