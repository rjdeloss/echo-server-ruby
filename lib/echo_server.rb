require 'socket'
require_relative 'server'
require_relative 'echo_response'


class EchoServer
    attr_reader :server, :is_server_open

    def initialize(server_socket)
        @server = nil
        @server_socket = server_socket
        @is_server_open = false
        @is_connected = false
    end

    def start
        open_server_connection
        accept_incoming_connections
    end

    def open_server_connection
        @server = @server_socket.open
        @is_server_open = true
        puts "Server is listening on port #{@server_socket.port}"
    end

    def client_handler(incoming_connection) 
        Thread.new(incoming_connection) do |connected|
            @is_connected = true
            puts "#{format_connection_info(connected)} is connected"

            EchoResponse.new(connected, @is_connected).echo_the_message

            disconnect(connected)
        end
    end

    private


    def accept_incoming_connections
        while @is_server_open
            connection = @server.accept
            client_handler(connection)
        end
    end

    def format_connection_info(connection)
        port, host = connection.peeraddr[1,2]
        "#{host}:#{port}"
    end

    def disconnect(connection)
        @is_connected = false
        puts "#{format_connection_info(connection)} has disconnected"
        connection.close
    end
end