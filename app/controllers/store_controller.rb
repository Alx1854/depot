class StoreController < ApplicationController
	include CurrentCart
	before_action :set_cart
  def index
  	@products = Product.order(:title)
  	@counter = session[:counter]
    @counter.nil? ? @counter = 0 : @counter+=1
    session[:counter] = @counter
  end
end
