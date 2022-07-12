class ClientMock
    attr_reader :readline, :output

    def initialize(input_array)
        @messages = input_array
        @message = ''
        @output = ''
    end

    def readline
        @messages.shift
    end

    def puts(message)
        @output = message
    end
end