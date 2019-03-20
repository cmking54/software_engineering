#require 'rspec'
require 'lab3'

describe "lab 3 tests" do
  context "chain tests" do
    it "should be defined" do
      expect([]).to respond_to(:chain)
      expect({}).to respond_to(:chain)
    end

    it "should work for an empty array" do
        xarr = []
        [].chain {|x| xarr << x}
        expect(xarr).to match_array([])
    end

    it "should work for an empty hash" do
        xarr = []
        {}.chain {|x| xarr << x}
        expect(xarr).to match_array([])
    end
  end

  context "time tests" do
    it "should respond to the five new methods" do
      expect {
        Time.now.at_beginning_of_min
      }.not_to raise_error

      expect {
        Time.now.at_beginning_of_hour
      }.not_to raise_error

      expect {
        Time.now.at_beginning_of_day
      }.not_to raise_error

      expect {
        Time.now.at_beginning_of_month
      }.not_to raise_error

      expect {
        Time.now.at_beginning_of_year
      }.not_to raise_error
    end
  end
end
