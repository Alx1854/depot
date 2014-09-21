class Product < ActiveRecord::Base
	#The validates() method is the standard Rails validator.
	#It will check one or more model fields against one or more conditions.
	#presence: true tells the validator to check that each of the named
	#fields is present and its contents are not empty.
	validates :title, :description, :image_url, presence: true
	#use the delightfully named numericality() option to verify that the price is a valid number.
	#We also pass the rather verbosely named :greater_than_or_equal_to option a value of 0.01.
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	#to ensure that no other row in the products table has the same title as the row we’re about to save.
	validates :title, uniqueness: true, length: {minimum: 10, message: 'Mínimo 10 carateres'}
	#check that the URL ends with one of .gif, .jpg, or .png.
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be URL for GIF, JPG, or PNG image.'
	}

	def self.latest
		Product.order(:updated_at).last
	end
end
