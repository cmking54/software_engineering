require 'rails_helper'

RSpec.describe Person, type: :model do
    context "Ranking scopes" do
        before(:each) do
            p1 = Person.create!(points: 7)
            p2 = Person.create!(points: 11)
            p3 = Person.create!(points: 16)
            p4 = Person.create!(points: 18)
        end
        it "should split people in three tiers" do
            q1 = Person.rank1
            q2 = Person.rank2
            q3 = Person.rank3
            expect(q1.length).to eq 2
            expect(q2.length).to eq 1
            expect(q3.length).to eq 1
        end
        it "should display in reverse order" do
            q = Person.rank1
            expect(q[0].points > q[1].points).to be true
        end
    end
    context "from_omniauth" do
        it "should exist" do
            expect(Person).to respond_to(:from_omniauth)
        end
    end
end
