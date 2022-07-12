require 'server_socket'
require 'echo_server'
require 'client_mock'
require 'server_mock'

describe EchoServer do
    describe 'Echo Server Class' do
        it 'should open a server connection' do
            server_socket = ServerSocket.new(3001)
            echo_server = EchoServer.new(server_socket)

            expect{echo_server.open_server_connection}.to output("Server is listening on port 3001\n").to_stdout
            expect(echo_server.is_server_open).to be(true)
            expect(echo_server.server).not_to be_nil
        end
        
        it 'should raise an exception if it opens a server on the wrong port' do
            server_socket = ServerSocket.new(-1)
            echo_server = EchoServer.new(server_socket)           
            expect{echo_server.open_server_connection}.to raise_exception(SocketError)
        end
        
        it 'should disconnect server_socket when server socket is called' do 
            server_socket = ServerSocket.new(3001)
            echo_server = EchoServer.new(server_socket) 
            echo_server.disconnect_socket

            expect(echo_server.is_server_open).to be(false)
            expect(echo_server.server).to be_nil
        end

        it 'should say client is connected when a client has connected' do 
            mock_connection = ClientMock.new(['.exit'])
            mock_server = MockServer.new(3001, mock_connection)


            expect{mock_server.client_handler(mock_connection)}.to output("client is connected\nclient has disconnected\n").to_stdout
        end

        it 'should display the message from the client' do
            mock_connection = ClientMock.new(['crator','.exit'])
            mock_server = MockServer.new(3001, mock_connection)


            expect{mock_server.client_handler(mock_connection)}.to output("client is connected\nClient says: crator\nclient has disconnected\n").to_stdout
        end

        it 'should say client has disconnected when a client has disconnected' do
            mock_connection = ClientMock.new(['.exit'])
            mock_server = MockServer.new(3001, mock_connection)


            expect{mock_server.client_handler(mock_connection)}.to output("client is connected\nclient has disconnected\n").to_stdout
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