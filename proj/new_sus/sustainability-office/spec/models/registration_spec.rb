require 'rails_helper'

RSpec.describe Registration, type: :model do
    context "self.exists?" do
        before(:each) do
            person = Person.create!
            meeting = Meeting.create!(points: 1)
            nonvalid_regi = Registration.create!(person_id: Person.create!.id, meeting_id: Meeting.create!(points: 1).id)
        end
        it "should know if there are valid registrations" do
            expect(Registration.exists?(Person.first, Meeting.first)).to be false 
            valid_regi = Registration.create!(person_id: Person.first.id, meeting_id: Meeting.first.id) 
            expect(Registration.exists?(Person.first, Meeting.first)).to be true
        end
    end
end
