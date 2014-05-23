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

    describe "#set_string" do
        it "receives a string" do
            @smart_split.set_string "foo"
            @smart_split.get_string.should == "foo"
        end
    end

    describe "#split" do
        it "splits a string into chunks" do
            @smart_split.set_string "foo"
            @smart_split.split(":").should == ["foo"]
        end
    end

end
