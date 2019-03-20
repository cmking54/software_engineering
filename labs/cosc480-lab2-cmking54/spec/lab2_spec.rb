require 'rspec'
require 'lab2'

describe "Lab 2" do
    context "Dessert class tests" do
      it "should be defined" do
        expect {
          Dessert.new "cake", 500
        }.not_to raise_error
      end
    end

    context "JellyBean class tests" do
      it "should be defined" do
        expect {
          JellyBean.new "licorice"
        }.not_to raise_error
      end

      it "should derive from Dessert" do
        j = JellyBean.new("cherry")
        expect(j.class.superclass).to eq(Dessert)
      end
    end

    context "perfect_square method on Numeric" do
       it "should exist" do
           expect {
             5.perfect_square?
           }.not_to raise_error
       end
    end

    context "to_piglatin method on String" do
       it "should exist" do
           expect {
             "hello".to_piglatin
           }.not_to raise_error
       end

       it "should work with an empty string" do
           expect("".to_piglatin).to eq ""
       end

       it "should work with string that doesn't start with a letter" do
           expect("!".to_piglatin).to eq "!"
       end
    end
end
