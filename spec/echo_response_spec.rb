require 'echo_response'
require 'client_mock'

describe EchoResponse do

    context 'Echo message' do 
        it 'should read the message from the client onto the server' do
            mock_connection = ClientMock.new(['apple', '.exit'])
            echo_response = EchoResponse.new(mock_connection, true)
            
            expect{echo_response.echo_the_message}.to output("Client says: apple\n").to_stdout
        end

        it 'should send the message to client from the server' do
            mock_connection = ClientMock.new(['bacon', '.exit'])
            echo_response = EchoResponse.new(mock_connection, true)
            echo_response.echo_the_message

            expect(mock_connection.output).to eq('bacon')
        end
        
        it 'should disconnect client when .exit is sent as a message' do
            mock_connection = ClientMock.new(['.exit'])
            echo_response = EchoResponse.new(mock_connection, true)
            echo_response.echo_the_message

            expect(echo_response.is_connected).to be(false)
        end

        it 'should take no action when not connected' do
            mock_connection = ClientMock.new(['strawberry', 'hello', 'world', '.exit'])

            EchoResponse.new(mock_connection, false).echo_the_message

            expect(mock_connection.output).to eq('')
        end

    end
end