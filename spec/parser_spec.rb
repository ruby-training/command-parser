require_relative '../lib/parser'

describe Parser do

    before :each do
        @parser = Parser.new(Transformer.new, SmartSplit.new)
    end
    
    describe "#new" do
        it "is instantiable" do
            @parser.should be_an_instance_of Parser
        end

        it "validates the first argument" do
            expect {
                Parser.new(nil, nil)
            }.to raise_error ArgumentError, "Got NilClass instead of Transformer"
        end

        it "validates the second argument" do
            expect {
                Parser.new(Transformer.new, nil)
            }.to raise_error ArgumentError, "Got NilClass instead of SmartSplit"
        end
    end

    describe "#parse" do
        it "parses a command" do
            result = {"name" => nil, "arguments" => [], "options" => {}}

            @parser.parse("").should == result

            @parser.parse("foo").should == result.merge({"name" => "foo"})

            @parser.parse("foo bar baz").should == result.merge({"name" => "foo", "arguments" => ["bar", "baz"]})
        
            @parser.parse(" foo  bar   ").should == result.merge({"name" => "foo", "arguments" => ["bar"]})
        
            @parser.parse("foo \"bar\" 'baz'").should == result.merge({"name" => "foo", "arguments" => ["bar", "baz"]})
        
            @parser.parse("foo --bar baz --wow=such").should == result.merge({"name" => "foo", "options" => {
                "bar" => {
                    "value" => "baz",
                    "volume" => 1
                },
                "wow" => {
                    "value" => "such",
                    "volume" => 1
                }
            }})

            @parser.parse("foo --bar -ab10").should == result.merge({"name" => "foo", "options" => {
                "bar" => {
                    "value" => nil,
                    "volume" => 1
                },
                "a" => {
                    "value" => nil,
                    "volume" => 1
                },
                "b" => {
                    "value" => "10",
                    "volume" => 1
                }
            }})

            @parser.parse("foo --ccc -vvv").should == result.merge({"name" => "foo", "options" => {
                "ccc" => {
                    "value" => nil,
                    "volume" => 1
                },
                "v" => {
                    "value" => nil,
                    "volume" => 3
                }
            }})
        end
    end

end
