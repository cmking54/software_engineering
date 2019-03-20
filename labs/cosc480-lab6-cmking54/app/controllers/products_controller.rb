class ProductsController < ApplicationController
  def index
    order = params[:order] || "name"
    @products = Product.sorted_by(order)
  end

  def show
    id = params[:id]
    begin
        @product = Product.find(id)
    rescue ActiveRecord::RecordNotFound
        redirect_to products_path and return
    end
  end
end
