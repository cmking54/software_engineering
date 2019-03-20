require 'rails_helper'

RSpec.describe Sight, type: :model do

    context "obtaining votes on a sight should work correctly" do
        it "should have zero up/down votes to start" do
            s = Sight.new
            expect(s.upvotes).to eq(0)
            expect(s.downvotes).to eq(0)
        end

        it "should correctly count upvotes" do
            s = Sight.create!
            u = User.create!(username: "X", email: "x@example.tld", password: "abcdef")
            s.up_down_votes.create!(upvote: true, user: u)
            s.up_down_votes.create!(upvote: true, user: u)
            expect(s.upvotes).to eq(2)
            expect(s.downvotes).to eq(0)
        end

        it "should correctly count downvotes" do
            s = Sight.create!
            u = User.create!(username: "X", email: "x@example.tld", password: "abcdef")
            s.up_down_votes.create!(upvote: false, user: u)
            s.up_down_votes.create!(upvote: false, user: u)
            expect(s.upvotes).to eq(0)
            expect(s.downvotes).to eq(2)
        end
    end
end
