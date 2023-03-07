import socket
import time
import os

time.sleep(0.1)

PORT = 8888
SIZE = 1000
DISCONNECT_MESSAGE = '!END'
FORMAT = 'utf-8'
#SERVER IP
SERVER = '192.168...' 
# OR
# SERVER = socket.gethostbyname(socket.gethostname())

ADDR = (SERVER, PORT)

f = open('received.txt', 'wb')

def main():
    print("Server Starting...")
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind(ADDR)
    server.listen()
    print(f"Server listening on {SERVER}...")
    conn, addr = server.accept()
    while True:
        mes = conn.recv(SIZE)
        if not mes:
            os.system('touch server_end.lock')
            break
        else:
            f.write(mes)
 
    f.close()
    conn.close()


if __name__ == "__main__":
    main()
