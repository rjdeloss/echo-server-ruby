class EchoResponse
    def initialize(connection)
        @connection = connection
    end

    def echo_the_message
        loop do
            message = @connection.readline
            break if message.include?('.exit')
            puts "Client says: #{message}"
            @connection.puts(message)
        end
    end
end