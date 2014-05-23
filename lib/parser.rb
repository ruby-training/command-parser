class Parser

    def initialize transformer
        raise ArgumentError, "Got #{transformer.class}, not Transformer" \
                                        unless transformer.instance_of? Transformer 
        @transformer = transformer
    end

    def parse command
        name = command.length > 0 ? command : nil
        {"name" => name, "arguments" => [], "options" => []}
    end

end
