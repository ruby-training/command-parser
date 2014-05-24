require_relative '../lib/smart_split'

describe SmartSplit do
    
    before :each do
        @smart_split = SmartSplit.new
    end

    describe "#new" do
        it "is instantiable" do
            @smart_split.should be_an_instance_of SmartSplit
        end
    end

    describe "#add_selector" do
        it "receives a selector" do
            @smart_split.add_selector "["
            @smart_split.add_selector "]"

            @smart_split.get_selectors.should == ["[", "]"]
        end
    end

    describe "#set_separator" do
        it "receives a separator" do
            @smart_split.set_separator ","
            @smart_split.get_separator.should == ","
        end
    end

    describe "#split" do
        it "splits a string into chunks" do
            @smart_split.set_separator ","
            @smart_split.split("").should == []
            @smart_split.split("foo").should == ["foo"]
        end
    end

end
