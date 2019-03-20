require 'rails_helper'

RSpec.describe PeopleController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      p = Person.new
      expect(Person).to receive(:find).with(eq(1).or eq("1")).and_return(p)
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

  # describe "POST #create" do
  #   it "redirects to people path" do
  #     p = Person.create!
  #     expect(Person).to receive(:find).with(eq(1).or eq("1")).and_return(p)
  #     post :create, :params => {:id =>"1"}
  #     expect(response).to redirect_to(people_path)
  #   end
  # end

  describe "GET #edit" do
    it "returns http success" do
      p = Person.new
      expect(Person).to receive(:find).with(eq(1).or eq("1")).and_return(p)
      get :edit, :params => {:id =>"1"}
      expect(response).to have_http_status(:success)
    end
  end

  # describe "PUT #update" do
  #   it "redirects to people path" do
  #     #p = Person.new
  #     #expect(Person).to receive(:update).with({first_name: 'bob'})
  #     put :update
  #     expect(response).to redirect_to(people_path)
  #   end
  # end

  describe "DELETE #destroy" do
    it "redirect to people path" do
      p = Person.new
      expect(Person).to receive(:find).with(eq(1).or eq("1")).and_return(p)
      delete :destroy, :params => {:id => "1"}
      expect(response).to redirect_to(people_path)
    end
  end



end
