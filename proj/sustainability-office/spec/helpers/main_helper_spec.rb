require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MainHelper. For example:
#
# describe MainHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MainHelper, type: :helper do
    context "The helper should exist as a container of helpful methods" do
        it "should exist" do
            expect(true).to be true
        end
    end 
end