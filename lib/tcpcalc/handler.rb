module TCPCalc
  class Handler
    def initialize(socket)
      @client = socket
      @rand = gen_rand
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
        return case cmd
        when "GET" then get
        when "ADD" then add(arg)
        when "SUBTRACT" then subtract(arg)
        when "EXIT" then client_exit
        else
          "invalid command\n"
        end
    end

    def get
      "#{@rand}\n"
    end

    def add(arg)
      if arg.to_s.empty?
        return "invalid command\n"
      else
        @rand += arg.to_i
        return "ok\n"
      end
    end

    def subtract(arg)
      if arg.to_s.empty?
        return "invalid command\n"
      else
        @rand -= arg.to_i
        return "ok\n"
      end
    end

    def client_exit
      "EXIT"
    end

    def gen_rand
      Random.new.rand(0..9)
    end
  end
end