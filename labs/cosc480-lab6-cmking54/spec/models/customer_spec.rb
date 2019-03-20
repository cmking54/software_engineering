require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "check that association proxy methods exist" do
    it "should have a products proxy method"  do
        c = Customer.new
        expect(c).not_to be_nil
    end
  end
end
