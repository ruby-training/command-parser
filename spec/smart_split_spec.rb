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

end
