require "tcpcalc/version"
require 'socket'

module TCPCalc

  PORT = 6789
  
  class Server
    attr_reader :port

    def initialize(port)
      @port = port
    end

    def listen
      socket = TCPServer.new(port)
      loop do
        handle_client socket.accept
      end
    end

    def handle_client(client)
      client.write("ok\n")
    ensure
      client.close
    end
  end
end
