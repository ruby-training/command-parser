class SmartSplit

    def initialize
        @selectors = []
        @separator = nil
    end

    def be_aware_of selector
        @selectors.push selector
    end

    def get_selectors
        @selectors
    end

    def set_separator separator
        @separator = separator
    end

    def get_separator
        @separator
    end

    def split string

    end

end
