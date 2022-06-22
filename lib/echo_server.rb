require 'socket'

host = 'localhost'
port = '5000'

class EchoServer
    @server = null

    def start()
        @server = TCPServer.open(host, port)
    end

    def open_server_connection()
        
    end

    def disconnect()
        @server.close()
    end
end