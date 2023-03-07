import socket
import time
import os

#IP OF THE SERVER
IP = '192.168.68.84'

#PORT NUMBER
PORT = 8888
DISCONNECT_MESSAGE = '!END'
ADDR = (IP, PORT)
FORMAT = "utf-8"
SIZE = 1000

def main():
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect(ADDR)
    f = open('test.uxp', 'rb')
    while True:
        fb = f.read(SIZE)
        if not fb:
            break
        client.sendall(fb)
    print("Data Sent by Client")
    client.shutdown(socket.SHUT_RDWR)
    os.system('touch client_end.lock')
    client.close()
    print('Client closed')
    f.close()


if __name__ == "__main__":
    main()  
