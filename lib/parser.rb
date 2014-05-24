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
        @chunks = split_into_chunks command
        {"name" => @chunks.shift, "arguments" => @chunks, "options" => []}
    end

    def split_into_chunks command
        @smart_split.split command
    end 

    private :split_into_chunks

end
