require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "root route" do
    it "routes to products#index" do
      expect(:get => '/').to route_to(:controller => "products", :action => "index")
    end
  end

  describe "GET #index" do
    it "routes correctly" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template and sorts by name by default" do
      x, y = Product.create!, Product.create!
      expect(Product).to receive(:sorted_by).with("name") { [x,y] }
      get :index
      expect(response).to render_template(:index)
      expect(assigns(:products)).to match_array([x,y])
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      p = Product.create!
      expect(Product).to receive(:find).with("1") { p }
      get :show, :params => { :id => 1 }
      expect(response).to render_template(:show)
    end

    it "redirects to index with a bad id" do
      get :show, :params => { :id => 2 }
      expect(response.status).to eq(302)
      expect(response).to redirect_to(products_path)
    end
  end
end