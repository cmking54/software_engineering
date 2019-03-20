#require 'rspec'
require 'part2'
require 'date'

describe "Part 2 tests" do
  context "currency converter methods" do
    it "should define the expected set of converter methods" do
      expect(1).to respond_to(:in)
    end

    it "should correctly compute conversions from a currency to itself" do
      expect(1.dollar.in(:dollars)).to eq(1)
      expect(1.euro.in(:euros)).to eq(1)
      expect(1.yen.in(:yen)).to eq(1)
      expect(1.rupee.in(:rupees)).to eq(1)
    end

  end

  context "palindrome extension" do
    it "should define the palindrome? method on String" do
      expect("").to respond_to(:palindrome?)
    end
  end

  context "time humanizing method" do
    it "should define the humanize method on the DateTime class" do
      expect(DateTime.now).to respond_to(:humanize)
    end
  end
end
