class Transformer

    def transform command
        command.gsub /\s\-([\-a-z]+)\s([^\s]+)/i do |match|
            key, value = match.split " "
            " #{key} #{value}" if key.start_with? "-" 
            " #{key}=#{value}"
        end
    end

end
