require_relative '../lib/parser'

describe Parser do

    before :each do
        @parser = Parser.new
    end
    
    describe "#new" do
        it "is instantiable" do
            @parser.should be_an_instance_of Parser
        end
    end

end
