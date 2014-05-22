require_relative '../lib/transformer'

describe Transformer do

    before :each do
        @transformer = Transformer.new
    end

    describe "#new" do
        it "can be instantiated" do
            @transformer.should_be_an_instance_of Transformer
        end
    end

end
