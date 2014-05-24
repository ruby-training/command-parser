class Parser

    def initialize transformer, smart_split
        raise ArgumentError, "Got #{transformer.class} instead of Transformer" unless transformer.is_a? Transformer 
        raise ArgumentError, "Got #{smart_split.class} instead of SmartSplit" unless smart_split.is_a? SmartSplit
        @transformer = transformer
        @smart_split = smart_split

        @smart_split.set_separator " "
        @smart_split.add_selector "\""
        @smart_split.add_selector '\''
    end

    def parse command
        @chunks = split_into_chunks @transformer.transform(command)
        {
            "name" => @chunks.shift,
            "arguments" => extract_arguments, 
            "options" => extract_options
        }
    end

    def split_into_chunks command
        @smart_split.split command
    end 

    def is_option? chunk
        chunk.start_with? "-"
    end

    def is_argument? chunk
        ! is_option? chunk
    end

    def extract_arguments
        @chunks.find_all { |chunk| is_argument? chunk }
    end

    def extract_options 
        chunks = @chunks.find_all { |chunk| is_option? chunk }
        options = {}
        chunks.each do |chunk|
            key, value = parse_option chunk
            options[key] = {"value" => value, "volume" => 1}
        end
        options
    end

    def parse_option chunk
        key, value = chunk.split "="
        [key.tr("-", ""), value]
    end

    private :split_into_chunks, :is_argument?, :is_option?, \
            :extract_arguments, :extract_options, :parse_option

end
