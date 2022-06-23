require_relative '../lib/echo_client'

client = EchoClient.new('localhost', 3001)
client.start