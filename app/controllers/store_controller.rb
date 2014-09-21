class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
  	@time = DateTime.now
  end
end
