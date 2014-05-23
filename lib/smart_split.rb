class SmartSplit

    def initialize
        @selectors = []
        @separator = nil
    end

    def add_selector selector
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
        [string]
    end

end
