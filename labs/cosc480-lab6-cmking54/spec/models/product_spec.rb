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

    it "should return 'Age 1' if min and max are set to the same value" do
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

    it "should return true to any age if neither min/max are set" do
      p = Product.new
      0.upto(10) { |a| expect(p.age_appropriate?(a)).to be true }
    end

    it "should check that the age is >= to min if min is set but max isn't" do
      p = Product.new
      p.minimum_age_appropriate = 3
      3.upto(10) { |a| expect(p.age_appropriate?(a)).to be true }
      0.upto(2) { |a| expect(p.age_appropriate?(a)).to be false }
    end

    it "should check that the age is between (inclusive) min and max if both min and max are set" do
      p = Product.new
      p.minimum_age_appropriate = 3
      p.maximum_age_appropriate = 6
      3.upto(6) { |a| expect(p.age_appropriate?(a)).to be true }
      0.upto(2) { |a| expect(p.age_appropriate?(a)).to be false }
      7.upto(10) { |a| expect(p.age_appropriate?(a)).to be false }
    end
  end

  context "the sorted_by method" do
    it "should exist" do
      expect(Product).to respond_to(:sorted_by)
    end

    it "should call the right underlying ActiveRecord method to do default sort" do
      expect(Product).to receive(:order).with("name") 
      Product.sorted_by("name")
    end

    it "should call the right underlying ActiveRecord method to sort by price" do
      expect(Product).to receive(:order).with("price") 
      Product.sorted_by("price")
    end

    it "should handle the situation when a bogus sort column is given" do
      expect(Product).to receive(:order).with("name") 
      Product.sorted_by("bogus_column")
    end
  end

  context "average_rating method" do
    it "should have an average_rating method" do
      p = Product.new
      expect(p).to respond_to(:average_rating)
    end

    it "should compute the average_rating correctly" do
      p = Product.create!(:name => "ACME test product")
      c = Customer.create!
      expect(p.average_rating).to eq(nil).or eq(0)

      r = Review.create!(:stars => 3, :product_id => p.id, :customer_id => c.id)
      expect(p.average_rating).to eq(3)

      r = Review.create!(:stars => 4, :product_id => p.id, :customer_id => c.id)
      expect(p.average_rating).to eq(3.5)

      r = Review.create!(:stars => 5, :product_id => p.id, :customer_id => c.id)
      expect(p.average_rating).to eq(4)
    end
  end

  context "check for association proxy methods" do
    it "should have a reviews method" do
        p = Product.new
        expect(p.reviews).to match_array([])
    end

    it "should have a customers method" do
        p = Product.new
        expect(p.customers).to match_array([])
    end
  end

  context "with_rating scope" do
    it "should have a with_rating scope" do
      expect(Product).to respond_to(:with_rating)
    end

    # your tests should go here for the with_rating scope
    it "should compute the with_rating correctly" do
      p = Product.create!(:name => "ACME test product")
      c = Customer.create!
      r_3 = Review.create!(:stars => 3, :product_id => p.id, :customer_id => c.id)
      r_4 = Review.create!(:stars => 4, :product_id => p.id, :customer_id => c.id)
      r_5 = Review.create!(:stars => 5, :product_id => p.id, :customer_id => c.id)
      res = Product.with_rating 3
      expect(res[0].id).to eq(p.id)
      res = Product.with_rating 4
      expect(res[0].id).to eq(p.id)
      res = Product.with_rating 5
      expect(res[0]).to eq(nil)
    end
    it "should collect all viable" do
      p = Product.create!(:name => "ACME test product")
      n = Product.create!(:name => "anti-ACME test product")
      c = Customer.create!
      r_p_1 = Review.create!(:stars => 1, :product_id => p.id, :customer_id => c.id)
      r_p_2 = Review.create!(:stars => 2, :product_id => p.id, :customer_id => c.id)
      r_n_1 = Review.create!(:stars => 4, :product_id => n.id, :customer_id => c.id)
      r_n_2 = Review.create!(:stars => 5, :product_id => n.id, :customer_id => c.id)

      res = Product.with_rating 1
      expect(res[0].id).to eq(p.id)
      expect(res[1].id).to eq(n.id)
      res = Product.with_rating 3
      expect(res[0].id).to eq(n.id)
    end
  end
end
