require_relative '../lib/echo_server.rb'

server = EchoServer.new(3001)
server.start