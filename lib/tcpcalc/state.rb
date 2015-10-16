module TCPCalc
  class State
    def initialize
      @nums = {}
    end

    def process_cmd(cmd,arg,id)
      if !@nums.has_key? id
        @nums[id] = gen_rand
      end
      return case cmd
      when "GET" then get(id)
      when "ADD" then add(arg,id)
      when "SUBTRACT" then subtract(arg,id)
      when "EXIT" then client_exit(id)
      else
        "invalid command\n"
      end
    end

    def get(id)
      "#{@nums[id]}\n"
    end

    def is_numeric?(s)
      !!Integer(s) rescue false
    end

    def add(arg,id)
      if arg.nil? || arg.empty? || !is_numeric?(arg)
        return "invalid command\n"
      else
        @nums[id] += arg.to_i
        return "ok\n"
      end
    end

    def subtract(arg,id)
      if arg.nil? || arg.empty? || !is_numeric?(arg)
        return "invalid command\n"
      else
        @nums[id] -= arg.to_i
        return "ok\n"
      end
    end

    def client_exit(id)
      @nums.delete(id)
      return "EXIT"
    end

    def gen_rand
      num = Random.new.rand(0..100)
      while @nums.has_value? num
        num = Random.new.rand(0..100)
      end
      return num
    end
  end
end