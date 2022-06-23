require 'socket'

class EchoServer
    attr_reader :server, :is_server_open

    def initialize(port)
        @port = port
        @server = nil
        @is_server_open = false
    end

    def start
        open_server_connection
        accept_incoming_connections
    end

    def open_server_connection
        @server = TCPServer.open(@port)
        @is_server_open = true
        puts "Server is running on port #{@port}"
    end

    private

    def accept_incoming_connections
        while @is_server_open
            server_socket = @server.accept
        end
    end
end

# SocketError