require 'rails_helper'

RSpec.describe Meeting, type: :model do
    context "The is_past? method" do
        it "should exist" do 
            expect(Meeting.new).to respond_to(:is_past?)
        end
        #it "should not be true with no filled date" do
        #    meeting = Meeting.new
        #    expect(meeting.is_past?).to be false
        #end
        it "should respond properly to a filled in date" do
            meeting = Meeting.new(points: 0)
            meeting.date = Date.new(1996,5,4)
            bad_day = Date.new(1996,5,3)
            great_day = Date.new(1996,5,5)

            expect(Date).to receive(:today).and_return(bad_day)
            expect(meeting.is_past?).to be false
            expect(Date).to receive(:today).and_return(great_day)
            expect(meeting.is_past?).to be true
        end
    end
end
