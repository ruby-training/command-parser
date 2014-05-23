require_relative '../lib/parser'

describe Parser do

    before :each do
        @parser = Parser.new(Transformer.new)
    end
    
    describe "#new" do
        it "is instantiable" do
            @parser.should be_an_instance_of Parser
        end

        it "validates the first argument" do
            expect {
                Parser.new nil
            }.to raise_error ArgumentError, "Got NilClass, not Transformer"
        end
    end

end
