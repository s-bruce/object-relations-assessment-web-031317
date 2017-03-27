# Please copy/paste all three classes into this file to submit your solution!

class Customer

  attr_accessor :first_name, :last_name

  ALL = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    ALL << self
  end

  def self.all
  	ALL
  end

  def self.find_by_name(name)
  	self.all.find do |customer|
  		customer.full_name == name
  	end
  end

  def self.find_all_by_first_name(name)
  	self.all.find_all do |customer|
  		customer.first_name == name
  	end
  end

  def self.all_names
  	self.all.collect do |customer|
  		customer.full_name
  	end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def add_review(restaurant, content)
  	Review.new(content, self, restaurant)
  end

end


class Restaurant

  attr_accessor :name

  ALL = []

  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all
  	ALL
  end

  def self.find_by_name(name)
  	self.all.find do |restaurant|
  		restaurant.name == name
  	end
  end

  def reviews
  	Review.all.find_all do |review|
  		review.restaurant == self
  	end
  end

  def customers
  	self.reviews.collect do |review|
  		review.customer
  	end.uniq
  end

end


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