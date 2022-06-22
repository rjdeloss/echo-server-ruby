require 'socket'

class EchoServer
    attr_reader :server

    def initialize(port)
        @port = port
        @server = nil
    end

    def start()
        @server = TCPServer.open(@port)
        puts "Server is running on port #{@port}"
    end
end

# server = EchoServer.new(3001)
# server.start