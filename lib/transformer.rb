class Transformer

    def transform command
        replace_white_spaces open_collapsed_options(command)
    end

    def replace_white_spaces command
        command.gsub /\s\-([\-a-z]+)\s([^\s]+)/i do |match|
            key, value = match.split " "
            " #{key} #{value}" if key.start_with? "-" 
            " #{key}=#{value}"
        end
    end

    def open_collapsed_options command
        command
    end

    private :replace_white_spaces, :open_collapsed_options

end
