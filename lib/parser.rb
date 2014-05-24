class Parser

    def initialize transformer
        raise ArgumentError, "Got #{transformer.class} instead of Transformer" unless transformer.is_a? Transformer 
        @transformer = transformer
    end

    def parse command
        name = command.length > 0 ? command : nil
        {"name" => name, "arguments" => [], "options" => []}
    end

end
