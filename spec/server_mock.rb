require_relative '../lib/echo_server'
require_relative '../lib/echo_response'

class MockServer < EchoServer
    attr_reader :server, :is_server_open

    def initialize(port, client)
        super(port)
        @client = client
    end

    def client_handler(client)
        @is_connected = true
        puts "client is connected"

        while @is_connected
            EchoResponse.new(@client, @is_connected).echo_the_message
            disconnect(client)
        end
    end
    
    private

    def disconnect(connection)
        @is_connected = false
        puts "client has disconnected"
    end
end