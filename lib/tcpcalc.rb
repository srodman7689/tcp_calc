require "tcpcalc/version"
require 'tcpcalc/state'
require 'tcpcalc/handler'
require 'socket'

module TCPCalc

  PORT = 6789

  class Server
    attr_reader :port

    nums = {}

    def initialize(port)
      @port = port
      @state = State.new
      @server = nil
    end

    def listen
      @server = TCPServer.new(port)
      loop do
        Thread.start(@server.accept) do |client|
          handled_client = Handler.new(client,@state)
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