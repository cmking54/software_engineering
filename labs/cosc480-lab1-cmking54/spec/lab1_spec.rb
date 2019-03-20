require 'rspec'
require 'lab1'

describe "Lab 1" do
  context "strip_tags" do
    it "should be defined" do
      expect {
        strip_tags ""
      }.not_to raise_error
    end

    it "should work correctly for an empty string" do
        expect(strip_tags('')).to eq ''
    end
  end

  context "starts_with_consonant?" do
    it "should be defined" do
      expect {
        starts_with_consonant? ""
      }.not_to raise_error
    end

    it "should work for an empty string" do
      expect(starts_with_consonant?('')).to be_falsy
    end
  end
end
