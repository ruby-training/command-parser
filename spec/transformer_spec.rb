require_relative '../lib/transformer'

describe Transformer do

    before :each do
        @transformer = Transformer.new
    end

    describe "#new" do
        it "can be instantiated" do
            @transformer.should be_an_instance_of Transformer
        end
    end

    describe "#transform" do
        it "replaces white spaces" do
            input = 'foo-test argument --bar "baz" --wow=such -f "amaze"'
            output = 'foo-test argument --bar="baz" --wow=such -f="amaze"'
            @transformer.transform(input).should == output
        end
    end

end
