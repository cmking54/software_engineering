require 'rspec'
require 'part1'

describe "Part 1 tests" do
  context "Palindrome tests" do
    it "should be defined" do
      expect {
        palindrome? ""
      }.not_to raise_error
    end

    it "should say that 'abc' is not a palindrome" do
        expect(palindrome?('abc')).to be false
    end

    it "should say that 'aba' is a palindrome" do
        expect(palindrome?('aba')).to be true
    end
  end

  context "Count words tests" do
    it "should be defined" do
      expect {
        count_words "a b c"
      }.not_to raise_error
    end

    it "should work correctly for a string with a single word" do
        expect(count_words("hello!")).to eq({"hello" => 1})
    end
  end

  context "Date string parsing tests" do
    it "should be defined" do
      expect {
        date_string_to_day_seconds("Ain't no time like Mon, 15 Jun 2009 20:45:30 GMT")
      }.not_to raise_error
    end
  end
end
