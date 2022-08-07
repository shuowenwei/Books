#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <cstdio>
#include <string.h>
#include <iostream>
#include <sys/errno.h>
#include <cstdlib>

using namespace std;

extern int errno;
const int MAX =200;//Max number of input
const int ARGMAX=10; //Max number of arguments
void exec_cmd(char *argv[],int tag);
void do_cd(char *argv[]);

int main(int argc,char *argv[])
{
	char InputLine[MAX];
	char *cmd_arg[ARGMAX];
	cout<<"====Dan's Shell===="<<endl;
	do{
		cout<<"Command>";
		cin.getline(InputLine,MAX,'\n');
		int i,j;
		for( i=0;i<ARGMAX;i++)  cmd_arg[i]=NULL;//delete arguments
		int CmdLen=strlen(InputLine);
		i=0;
		j=0;
		int tag=0;
		while(i<CmdLen && j<ARGMAX){
			if(InputLine[i]==' '){
				InputLine[i]='\0'; //put end of line at end of each argument
				tag=0;
				}
			else{
				if(tag==0){
					//Pointer array to the argu list
					cmd_arg[j]=InputLine+i;
					j++;
					tag=1;
					}
				}
				i++;
			}
		if(strcmp(cmd_arg[0],"quit")==0){
			cout<<"====Bye Bye===="<<endl;//quit Dan's shell
			break;
		}
		if(strcmp(cmd_arg[0],"cd")==0){ 
			chdir(cmd_arg[1]);//cd capability
			continue;
		}
		exec_cmd(cmd_arg,tag); //tag is a flag
	}while(1);
	return 1;
}
void exec_cmd(char *argv[],int tag)
{
	int pid,cpid;
	pid=fork();
	if (pid==0){//child process
			if(execvp(argv[0],&argv[0])<0){//has error
				cout<<argv[0]<<endl;
				switch(errno){ //catch the error here
					case ENOENT:
					cout<<"Error! Command or file not found "<<endl;
					break;
					default :
					cout<<"Error!"<<endl;
					break;
				}
			}						
	    }
	else{ //perant process
		cpid=waitpid(pid,NULL,0);//wait for process termination	
	}
	
}
