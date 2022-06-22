require 'socket'

class EchoServer
    attr_reader :server

    def initialize(port)
        @port = port
        @server = nil
    end

    def start
        open_server_connection
        accept_incoming_connections
    end

    def open_server_connection
        @server = TCPServer.open(@port)
        puts "Server is running on port #{@port}"
    end

    def accept_incoming_connections
        while true
            server_socket = @server.accept
        end
    end
end

server = EchoServer.new(3001)
server.start