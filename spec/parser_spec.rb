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

    describe "#parse" do
        it "parses a command" do
            @parser.parse("").should == {"name" => nil, "arguments" => [], "options" => []}

            @parser.parse("foo").should == {"name" => "foo", "arguments" => [], "options" => []}
        end
    end

end
