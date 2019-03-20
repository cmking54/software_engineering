require 'rails_helper'

RSpec.describe MeetingsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      m = Meeting.new
      expect(Meeting).to receive(:find).with(eq(1).or eq("1")).and_return(m)
      get :show, :params => {:id => "1"}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #create" do
  #   it "returns http success" do
  #     m = Meeting.new
  #     expect(Meeting).to receive(:find).with(eq(1).or eq("1")).and_return(m)
  #     get :create, :params => {:id => "1"}
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #edit" do
    it "returns http success" do
      m = Meeting.new
      expect(Meeting).to receive(:find).with(eq(1).or eq("1")).and_return(m)
      get :edit, :params => {:id => "1"}
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #update" do
  #   it "returns http success" do
  #     m = Meeting.new
  #     expect(Meeting).to receive(:find).with(eq(1).or eq("1")).and_return(m)
  #     get :update, :params => {:id => "1"}
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "DELETE #destroy" do
    it "redirect to meetings path" do
      m = Meeting.new
      expect(Meeting).to receive(:find).with(eq(1).or eq("1")).and_return(m)
      delete :destroy, :params => {:id => "1"}
      expect(response).to redirect_to(meetings_path)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

end
