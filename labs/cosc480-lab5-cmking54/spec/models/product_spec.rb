require 'rails_helper'

RSpec.describe Product, type: :model do
  context "The age_range method should create a user-friendly string" do
    it "should have an 'age_range' that creates a user-friendly string" do
      p = Product.new
      expect(p).to respond_to(:age_range)
    end

    it "should return '0 and above' if neither min or max is set" do
      p = Product.new
      expect(p.age_range).to eq("0 and above")
    end

    it "should return '1 to 3' if min is set to 1 and max is set to 3" do
      p = Product.new
      p.minimum_age_appropriate = 1
      p.maximum_age_appropriate = 3
      expect(p.age_range).to eq("1 to 3")
    end

    it "should return '1 and above' if min is set to 1 but max is not set" do
      p = Product.new
      p.minimum_age_appropriate = 1
      expect(p.age_range).to eq("1 and above")
    end

    it "should return 'Age 1' if min is set to 1 but max is not set" do
      p = Product.new
      p.minimum_age_appropriate = 1
      p.maximum_age_appropriate = 1
      expect(p.age_range).to eq("Age 1")
    end

  end

  context "The age_appropriate? predicate should determine whether a toy is age-appropriate or not" do
    it "should have an 'age_appropriate?' predicate method" do
      p = Product.new
      expect(p).to respond_to(:age_appropriate?)
    end

    # 
    # Additional lab 5 tests for age_appropriate? go here!
    #


  end

  context "the sorted_by method" do
    it "should exist" do
      expect(Product).to respond_to(:sorted_by)
    end

    it "should call the right underlying ActiveRecord method to do default sort" do
      expect(Product).to receive(:order).with(eq("name").or eq(:name))
      Product.sorted_by("name")
    end

    it "should call the right underlying ActiveRecord method to sort by price" do
      expect(Product).to receive(:order).with(eq("price").or eq(:price))
      Product.sorted_by("price")
    end

    it "should handle the situation when a bogus sort column is given" do
      expect(Product).to receive(:order).with(eq("name").or eq(:name))
      Product.sorted_by("bogus_column")
    end
  end

end
