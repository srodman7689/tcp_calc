require "tcpcalc/version"
require 'tcpcalc/handler'
require 'socket'

module TCPCalc

  PORT = 6789

  class Server
    attr_reader :port

    nums = {}

    def initialize(port)
      @port = port
      @server = nil
    end

    def listen
      @server = TCPServer.new(port)
      loop do
        Thread.start(@server.accept) do |client|
          handled_client = Handler.new(client)
          handled_client.process!
        end
      end
    end

    def stop
      @server.close
      exit
    end
  end
end


