/*
   Local include file for socket programs
*/
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#include <stdlib.h>
// #include <signal.h>
// #include <wait.h>
#include <sys/types.h>
#include <sys/socket.h>
// #include <sys/un.h>
#include <netdb.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define PORT 6996                 // Arbitrary port programmer chooses
static char buf[BUFSIZ];               // Buffer for messages
// const  char *SERVER_FILE="server_socket";
