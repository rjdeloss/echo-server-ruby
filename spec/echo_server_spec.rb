require "echo_server"

describe EchoServer do

    describe ".test" do
        it "basic test for Ruby CI" do 
            expect(true).to eq(true)
        end
    end

    describe ".start" do
        it "should open a server connection" do

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