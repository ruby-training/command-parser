class SmartSplit

    def initialize
        @selectors = []
    end

    def be_aware_of selector
        @selectors.push selector
    end

    def get_selectors
        @selectors
    end

end
