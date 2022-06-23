require 'socket'

class EchoClient
    attr_reader :server_socket, :is_socket_open

    def initialize(host_name, port)
        @host_name = host_name
        @port = port
        @server_socket = nil
        @is_socket_open = false
    end

    def start
        open_server_socket
        
        while message = gets
            if message.include?('.exit')
                break
            end

            puts message
        end

        disconnect
    end

    def open_server_socket
        @server_socket = TCPSocket.open(@host_name, @port)
        puts "Socket is connected to server"

    end

    def disconnect
        @server_socket.close
    end
end

# Errno::ECONNREFUSED