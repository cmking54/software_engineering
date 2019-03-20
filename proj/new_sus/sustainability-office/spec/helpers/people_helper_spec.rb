require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PeopleHelper. For example:
#
# describe PeopleHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PeopleHelper, type: :helper do
    context "Te helper should exist as a container for helpfu methods" do
        it  "should exist" do
            expect(true). to be true
        end
    end
end
