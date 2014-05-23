require_relative '../lib/transformer'

describe Transformer do

    before :each do
        @transformer = Transformer.new
    end

    describe "#new" do
        it "is instantiable" do
            @transformer.should be_an_instance_of Transformer
        end
    end

    describe "#transform" do
        it "replaces white spaces" do
            input = 'foo-test argument --bar "baz" --wow=such -f "amaze"'
            output = 'foo-test argument --bar="baz" --wow=such -f="amaze"'
            @transformer.transform(input).should == output
        end

        it "opens collapsed options" do
            @transformer.transform("foo -vv -abc").should == "foo -v -v -a -b -c"
        end

        it "places a white space" do
            @transformer.transform("foo -abc10").should == "foo -a -b -c=10"
        end
    end

end
