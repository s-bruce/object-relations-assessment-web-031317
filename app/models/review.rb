class Review
  
	attr_accessor :content, :customer, :restaurant

	ALL = []

	def initialize(content, customer, restaurant)
		@content = content
		@customer = customer
		@restaurant = restaurant
		ALL << self
	end

	def self.all
		ALL
	end

end