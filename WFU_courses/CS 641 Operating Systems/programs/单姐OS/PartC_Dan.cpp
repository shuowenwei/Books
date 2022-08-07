#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <cstdio>
#include <string.h>
#include <iostream>
#include <sys/errno.h>
#include <cstdlib>
#include <limits.h>
#include <fcntl.h>

using namespace std;
#define STDOUT 1   
extern int errno;
const int MAX =200;//Max number of input
const int ARGMAX=10; //Max number of arguments
void exec_pipe(char *argv[]);//when find "|"
void exec_input(char *argv[]);//when find "<"
void exec_output(char *argv[]);//when find ">"
void exec_general(char *argv[],int tag);//Part A & B(when find"&")

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
		int CmdLen=strlen(InputLine);//the length of arguments
		i=0;
		j=0;
		int tag=0;//segregate  arguments
		int pipetag=0;// find "|"
        int inputtag=0;// find "<"
        int outputtag=0;//find ">"
		while(i<CmdLen && j<ARGMAX){
			if(InputLine[i]==' '){
				InputLine[i]='\0'; //put end of line at end of each argument
				tag=0;             
				}
			else if (InputLine[i]=='&'){
				InputLine[i]='\0'; //take out "&"
				tag=2;
				}
			else if(InputLine[i]=='|'){
				InputLine[i]='\0'; //take out "|" and put end of line at end of each argument
				tag=0;
				pipetag=1;
				}
			else if(InputLine[i]=='<'){
				InputLine[i]='\0'; //take out "<" and put end of line at end of each argument
				tag=0;
				inputtag=1;
				}
           	else if(InputLine[i]=='>'){
				InputLine[i]='\0'; //take out ">" and put end of line at end of each argument
				tag=0;
				outputtag=1;
				}
			else{
				if(tag==0){		//Pointer array to the argu list
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
        
		if(pipetag==1) exec_pipe(cmd_arg); // if "|",execute function exec_pipe
		else if (inputtag==1) exec_input(cmd_arg);// if "<",execute function exec_input
		else if (outputtag==1) exec_output(cmd_arg);// if ">",execute function exec_out
		else exec_general(cmd_arg,tag);// if no "<",no"|" and no ">",execute function exec_general as Part A & B 
	}while(1);
	return 1;
}
void exec_general(char *argv[],int tag) // Part A and B
{
	int pid,cpid;
	pid=fork();
	if (pid==0){//child process
			
			sleep(3);
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
	else{
		if (tag == 2)// when find "& "
		{
			cout<<"......running"<<endl;
			
		}
		else{
			cpid=waitpid(pid,NULL,0);//wait for process termination	
			
		}
	}
	
}
void exec_pipe(char *argv[]) //when find "|"
{
		 FILE *fin, *fout;
	   	 char buffer[PIPE_BUF];
	   	 int n;
	   	 fin  = popen(argv[0],"r");// the firt process
	   	 fout = popen(argv[1],"w");// the second process
	   	 fflush(fout);
	   	 while ((n = read(fileno(fin),buffer,PIPE_BUF))>0)
	   	    	write(fileno(fout),buffer,n);
	   	 pclose(fin);
	   	 pclose(fout);
}

void exec_input(char *argv[])//when find "<"
{
    FILE *fin;
    char buffer[PIPE_BUF];
    int n, filename, oldstdout;
    fin = popen(argv[1],"r");// the second process
    filename = open(argv[0], O_CREAT | O_RDWR,
       S_IREAD | S_IWRITE);// create a file 
    oldstdout = dup(STDOUT); // create a duplicate handle for standard output
    dup2(filename, STDOUT);
    close(filename);
    while((n= read(fileno(fin),buffer,PIPE_BUF))>0)
		write(STDOUT,buffer,n);//redirection
    dup2(oldstdout, STDOUT);
    close(oldstdout);
}

void exec_output(char *argv[])
{
   
    FILE *fin;
    char buffer[PIPE_BUF];
    int n, filename, oldstdout;
    fin = popen(argv[0],"r");// the first process
    filename = open(argv[1], O_CREAT | O_RDWR,
       S_IREAD | S_IWRITE);// create a file 
    oldstdout = dup(STDOUT); // create a duplicate handle for standard output
    dup2(filename, STDOUT);
    close(filename);
    while((n= read(fileno(fin),buffer,PIPE_BUF))>0)
		write(STDOUT,buffer,n);//redirection
    dup2(oldstdout, STDOUT);
    close(oldstdout);
}

