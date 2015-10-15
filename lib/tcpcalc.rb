require "tcpcalc/version"

class TCPCalc
  attr_reader :port
  
  DEFAULT_PORT = 6789

  def initialize
  end

  def start(port=DEFAULT_PORT)
    @port = port
    true
  end
end
