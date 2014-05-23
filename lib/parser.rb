class Parser

    def initialize transformer
        raise ArgumentError, "Got #{transformer.class}, not Transformer" \
                                        unless transformer.instance_of? Transformer 
        @transformer = transformer
    end

end
