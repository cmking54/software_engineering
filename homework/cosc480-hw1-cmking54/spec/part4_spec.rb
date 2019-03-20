require 'rspec'
require 'part4'

describe "Part 4 tests" do
  context "Car class tests" do
    it "should be defined" do
      expect {
        Car.new "Studebaker"
      }.not_to raise_error
    end
  end

  context "PostcodeLocation class tests" do
    it "should be defined" do
      expect {
        PostcodeLocation.new "Test", "TE", 0, 0
      }.not_to raise_error
    end
  end

  context "UKPostcodes class tests" do
    it "should be defined" do
      expect {
        UKPostcodes.new 
      }.not_to raise_error
    end
  end

end
