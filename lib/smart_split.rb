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
        chunks = []
        buffer = ""
        selector = false
        string.split("").each do |character|
            if @selectors.include? character
                selector = ! selector
                next
            end
            if not(selector) and (character == @separator)
                chunks.push buffer unless buffer.empty?
                buffer = ""
            else
                buffer << character
            end
        end
        if not buffer.empty?
            chunks.push buffer
        end
        chunks
    end

end
