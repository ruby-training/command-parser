class SmartSplit

    def initialize
        @selectors = []
        @string = nil
    end

    def be_aware_of selector
        @selectors.push selector
    end

    def get_selectors
        @selectors
    end

    def set_string string
        @string = string
    end

    def get_string
        @string
    end

    def split separator
        
    end

end
