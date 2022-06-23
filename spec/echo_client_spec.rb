require 'echo_server'
require 'echo_client'

describe EchoClient do
    describe 'Client Class' do
        it 'should create instance of a client' do
            client = EchoClient.new('localhost', 5000)

            expect(client.is_socket_open).to be(false)
        end
    end
end