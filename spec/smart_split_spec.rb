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

    describe "#be_aware_of" do
        it "receives a selector" do
            @smart_split.be_aware_of "["
            @smart_split.be_aware_of "]"

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
            @smart_split.split("foo").should == ["foo"]
        end
    end

end
