require 'socket'

class Client
    def initialize(host_name, port)
        @host_name = host_name
        @port = port
        @server_socket = nil
    end

    def start
        open_server_socket
        
        while message = gets
            if message.include?(".exit")
                disconnect
            end

            puts message
        end
    end

    def open_server_socket
        @server_socket = TCPSocket.open(@host_name, @port)
        puts "Socket is connected to server"

    end

    def disconnect
        @server_socket.close
    end
end