require 'rails_helper'

RSpec.describe SightsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "orders sights by upvotes" do
      s1 = Sight.create!(:title => "a")
      u = User.create!(:username => "x", :email => "x@x.com", :password => "abcdef")
      s1.up_down_votes.create!(upvote: true, user: u)
      s1.up_down_votes.create!(upvote: false, user: u)
      s1.up_down_votes.create!(upvote: false, user: u)

      s2 = Sight.create!(:title => "b")
      u = User.create!(:username => "y", :email => "y@y.com", :password => "abcdef")
      s2.up_down_votes.create!(upvote: true, user: u)
      s2.up_down_votes.create!(upvote: true, user: u)
      s2.up_down_votes.create!(upvote: false, user: u)

      get :index
      expect(assigns(:sights)).to eq([s2, s1])
    end
  end

  describe "GET #show" do
    it "redirects to index on a bad id" do
      expect(Sight).to receive(:find).and_raise(ActiveRecord::RecordNotFound)
      get :show, :params => {:id => 1}
      expect(response).to redirect_to(sights_path) 
    end

    it "returns http success" do
      s = Sight.new
      expect(Sight).to receive(:find).with(eq(1).or eq("1")).and_return(s)
      get :show, :params => {:id => "1"}
      expect(response).to have_http_status(:success)
    end
  end

end
