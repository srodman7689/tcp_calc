module TCPCalc
  class Handler
    def initialize(socket,state)
      @client = socket
      @state = state
      @id = @client.to_s
    end

    def process!
      loop do 
        data = @client.gets
        break unless !data.nil?
        cmd, arg = data.split(" ")
        response = process_cmd(cmd,arg)
        if response != "EXIT"
          @client.write(response)
        else
          break
        end
      end
    ensure
      @client.close
    end

    def process_cmd(cmd,arg)
      return @state.process_cmd(cmd,arg,@id)
    end
  end
end