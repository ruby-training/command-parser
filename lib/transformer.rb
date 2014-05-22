class Transformer

    def transform command
        replace_white_spaces open_collapsed_options(command)
    end

    def replace_white_spaces command
        command.gsub /\s\-([\-a-z]+)\s([^\s]+)/i do |match|
            key, value = match.split " "
            if value.start_with? "-"
                match
            else
                " #{key}=#{value}"
            end
        end
    end

    def open_collapsed_options command
        command.gsub! /\s\-([a-z]{2,})/i do |match|
            options = String.new
            match.gsub("-", "").split("").each do |option|
                options << " -#{option}" unless option.strip.empty?
            end
            options
        end
        #
        return command
        #
        command.gsub /\-([a-z]{1})([^\sa-z]+)/i do |match|
            puts match
            key, value = ['', '']
            "-#{key}=#{value}"      
        end
    end

    private :replace_white_spaces, :open_collapsed_options

end
