require 'socket'

class ServerSocket
    attr_reader :port, :server_socket, :open, :close

    def initialize(port)
        @port = port
        @server_socket = TCPServer
    end

    def open
        @server_socket.open(@port)
    end
end