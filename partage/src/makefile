OBJ=iftun.o main.o extremite.o init-from-file.o

tunnel.exe: $(OBJ)
	gcc -Wall $(OBJ) -o tunnel.exe
	cp tunnel.exe ext1/
	cp tunnel.exe ext2/

main.o: main.c iftun.h extremite.h init-from-file.h
	gcc -Wall -c main.c -o main.o

iftun.o: iftun.h iftun.c
	gcc -Wall -c iftun.c -o iftun.o

extremite.o : extremite.c extremite.h
	gcc -Wall -c extremite.c -o extremite.o

init-from-file.o: init-from-file.h init-from-file.c
	gcc -Wall -c init-from-file.c -o init-from-file.o

clean:
	rm -f *.o *.exe
	rm -f ext1/*.exe
	rm -f ext2/*.exe
