require_relative '../lib/echo_server.rb'
require_relative '../lib/server.rb'

server_socket = ServerSocket.new(3001)
echo_server = EchoServer.new(server_socket)
echo_server.start