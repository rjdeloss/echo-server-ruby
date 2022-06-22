require 'echo_server'

describe EchoServer do

    describe '.test' do
        it 'basic test for Ruby CI' do 
            expect(true).to eq(true)
        end
    end

    describe 'start method' do
      it 'should create an instance of a server' do
        echo_server = EchoServer.new(3001)

        expect{echo_server.start}.to output("Server is running on port 3001\n").to_stdout
        expect(echo_server.server).not_to be_nil
        end
    end
end

# Steps for Echo Server

# Server
# 1 - open server connection
# 2 - open input and output streams
# 3 - start an input loop 
# 7 - closes the connection

# Client
# 4 - Sends message to the server
# 5 - Receives a message from the server
# 6 - Disconnects