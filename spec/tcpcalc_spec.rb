require 'spec_helper'

describe "TCPCalc", :acceptance do 
  it 'responds with ok' do
    with_server do
      s = client()
      response = s.gets()
      s.close()
      expect(response).to eq("ok\n")
    end
  end

  def client
    TCPSocket.new('localhost', TCPCalc::PORT)
  end

  def with_server
    server_thread = Thread.new do
      server = TCPCalc::Server.new(TCPCalc::PORT)
      server.listen
    end

    wait_for_open_port TCPCalc::PORT
    yield
  ensure
    Thread.kill(server_thread) if server_thread
  end

  def wait_for_open_port(port)
    time = Time.now
    while !check_port(port) && 1 > Time.now - time
      sleep 0.01
    end

    raise TimeoutError unless check_port(port)
  end

  def check_port(port)
    begin
      s = client
      s.close
      return true
    rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
      return false
    end
  end
end
