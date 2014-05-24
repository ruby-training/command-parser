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
            }.to raise_error ArgumentError, "Got NilClass instead of Transformer"
        end
    end

    describe "#parse" do
        it "parses a command" do
            result = {"name" => nil, "arguments" => [], "options" => []}

            @parser.parse("").should == result

            @parser.parse("foo").should == result.merge({"name" => "foo"})
        end
    end

end
