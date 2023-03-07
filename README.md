# Socket-Programming
*******************
The Client consists of test.sh which has codes to create the .iic file using .xml file.
The .iic file is then used to create the UXP file.
*******************
Linux's inbuilt "TOP" command is used to measure the CPU % and Memory usage during socket data transfer.
"top -d 0" implies no delay between iterations.
"top -b" implies batch mode to write the data to a file.
"top n 500" implies 500 iterations. 
But if the client.py program finishes before 500 iterations the "kill -9" command kills top command.
******************
Server.py is pretty straight forward, it receives the data from client and writes the received bytes to a file.
