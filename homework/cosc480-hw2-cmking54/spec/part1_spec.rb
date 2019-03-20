#require 'rspec'
require 'part1'

describe "Part 1 tests" do
  context "accessor with history" do
    it "should be defined" do
      expect {
          class X
              attr_accessor_with_history :x
          end
      }.not_to raise_error
    end
  end
end
