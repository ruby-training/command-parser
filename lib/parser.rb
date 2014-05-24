class Parser

    def initialize transformer, smart_split
        raise ArgumentError, "Got #{transformer.class} instead of Transformer" unless transformer.is_a? Transformer 
        raise ArgumentError, "Got #{smart_split.class} instead of SmartSplit" unless smart_split.is_a? SmartSplit
        @transformer = transformer
        @smart_split = smart_split
    end

    def parse command
        name = command.length > 0 ? command : nil
        {"name" => name, "arguments" => [], "options" => []}
    end

end
