.PHONY:clean all

WORKDIR=.
VPATH = ./src

CC=g++
CFLGS= -Wall -g -I$(WORKDIR)/inc/
LIBFLAG = -L$(HOME)/lib


BIN = keymngclient  #keymngserver 

all:$(BIN)

#keymngclientop.o  
keymngclient:keymngclient.o   keymnglog.o  myipc_shm.o  keymng_shmop.o  keymngclientapp.o
	$(CC) $(LIBFLAG) $^ -o $@ -lpthread -litcastsocket -lmessagereal  

# 
keymngserver:keymngserver.o  keymngserverop.o  keymnglog.o  myipc_shm.o  keymng_shmop.o keymng_dbop.o 
	$(CC) $(LIBFLAG) $^ -o $@ -lpthread -litcastsocket -lmessagereal  -lclntsh  -licdbapi
 
#testdbapi:testdbapi.o  
#	$(CC) $(LIBFLAG) $^ -o $@ -lpthread  -lclntsh  -licdbapi
		
%.o:%.cpp
	$(CC) $(CFLGS) -c $< -o $@	

clean:
	rm -f *.o $(BIN)
	
	
	




