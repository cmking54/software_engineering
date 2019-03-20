class ProductsController < ApplicationController
  def index
    order = params[:order] || "name"
    @products = Product.sorted_by(order)
  end

  def show
    id = params[:id]
    @product = Product.find(id)
  end
end
