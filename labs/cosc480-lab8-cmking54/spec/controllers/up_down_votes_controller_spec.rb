require 'rails_helper'

RSpec.describe UpDownVotesController, type: :controller do
    it "should require login to vote" do
      s = Sight.create!(:title => 'x')
      expect(s.upvotes).to eq(0)
      expect(s.downvotes).to eq(0)
      post :upvote, :params => {:id => 1}
      expect(response).to redirect_to(new_user_session_path)
    end

    it "should do upvote correctly" do 
      u = User.create!(:username => 'x', :email => 'x@x.com', :password => 'abcdef')
      sign_in u
      s = Sight.create!(:title => 'x')
      expect(s.upvotes).to eq(0)
      expect(s.downvotes).to eq(0)
      expect(Sight).to receive(:find).with(eq(1).or eq("1")).and_call_original
      post :upvote, :params => {:id => 1}
      expect(s.upvotes).to eq(1)
      expect(s.downvotes).to eq(0)
    end

    it "should do downvote correctly" do
      u = User.create!(:username => 'x', :email => 'x@x.com', :password => 'abcdef')
      sign_in u
      s = Sight.create!(:title => 'x')
      expect(s.upvotes).to eq(0)
      expect(s.downvotes).to eq(0)
      expect(Sight).to receive(:find).with(eq(1).or eq("1")).and_call_original
      post :downvote, :params => {:id => 1}
      expect(s.upvotes).to eq(0)
      expect(s.downvotes).to eq(1)
    end

    it "should redirect to index on a bad id" do
      u = User.create!(:username => 'x', :email => 'x@x.com', :password => 'abcdef')
      sign_in u
      post :upvote, :params => {:id => 1}
      expect(response).to redirect_to(sights_path)
    end
end
