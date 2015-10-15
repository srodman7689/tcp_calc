require 'spec_helper'

describe TCPCalc do
  before(:each) do
    @tcpcalc = TCPCalc.new
  end

  it 'has a version number' do
    expect(TCPCalc::VERSION).not_to be nil
  end

  it 'starts when told to start' do
    started = @tcpcalc.start()
    expect(started).to eq(true)
  end

  it 'starts on default port when not given one' do
    @tcpcalc.start()
    port_num = @tcpcalc.port
    expect(port_num).to eq(TCPCalc::DEFAULT_PORT)
  end

  it 'starts on a specific port when given one' do
    expected_port = 4567
    @tcpcalc.start(expected_port)
    port_num = @tcpcalc.port
    expect(port_num).to eq(expected_port)
  end
end
