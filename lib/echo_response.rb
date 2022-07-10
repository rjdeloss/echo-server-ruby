class EchoResponse
    attr_reader :message
    
    def initialize(connection, is_connected=true)
        @connection = connection
        @is_connected = is_connected
        @message=''
    end

    def echo_the_message
        while @is_connected
            @message = @connection.readline
            if @message.include?('.exit')
                @is_connected = false
                break
            end

            puts "Client says: #{@message}"
            @connection.puts(@message)
        end
    end
end