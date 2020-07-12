###
```
sudo apt-get install mingw-w64

C
i686-w64-mingw32-gcc hello.c -o hello32.exe # 32-bit 
x86_64-w64-mingw32-gcc hello.c -o hello64.exe # 64-bit 

C++
i686-w64-mingw32-g++ hello.cc -o hello32.exe # 32-bit 
x86_64-w64-mingw32-g++ hello.cc -o hello64.exe # 64-bit 

# C
i686-w64-mingw32-gcc hello.c -o hello32.exe # 32-bit
x86_64-w64-mingw32-gcc hello.c -o hello64.exe # 64-bit

# C++
i686-w64-mingw32-g++ hello.cc -o hello32.exe # 32-bit
x86_64-w64-mingw32-g++ hello.cc -o hello64.exe # 64-bit
```
### Dll
```
i686-w64-mingw32-gcc-win32 dll.c -o payload.dll -lws2_32 -shared
```
```
i686-w64-mingw32-g++ final.cpp -o file.exe -lws2_32 -s -ffunction-sections -fdata-sections -Wno-write-strings -fno-exceptions -fmerge-all-constants -static-libstdc++ -static-libgcc
```
