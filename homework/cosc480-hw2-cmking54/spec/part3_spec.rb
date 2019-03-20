#require 'rspec'
require 'part3'

describe "Part 3 tests" do
  context "CartesianProduct tests" do
    it "should be defined" do
      expect {
        c = CartesianProduct.new([],[])
        c.each { |x|  x }
      }.not_to raise_error
    end
  end

  context "BinaryTree tests" do
    it "should be defined" do
      expect {
        b = BinaryTree.new()
        b.each { |x| }
      }.not_to raise_error
    end

    it "should be empty initially" do
      b = BinaryTree.new
      expect(b.empty?).to be true
      b << 5
      expect(b.empty?).to be false
    end
  end
end
