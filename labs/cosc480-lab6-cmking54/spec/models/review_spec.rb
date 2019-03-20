require 'rails_helper'

RSpec.describe Review, type: :model do
  context "check that association proxy methods exist" do
      it "should have a customer proxy method"  do
        r = Review.new
        expect(r).to respond_to(:customer)
        expect(r.customer).to be_nil
      end

      it "should have a product proxy method"  do
        r = Review.new
        expect(r).to respond_to(:product)
        expect(r.product).to be_nil
      end
  end
end
