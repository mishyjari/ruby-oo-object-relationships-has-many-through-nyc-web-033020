class Customer
	@@all = []
	attr_accessor :name, :age
	def initialize (name,age)
		@name = name
		@age = age
		Customer.all << self
	end
	def self.all
		@@all
	end
	def new_meal(waiter,total,tip)
		Meal.new(waiter,self,total,tip)
	end
	def meals
		Meal.all.select{ |meal| meal.customer == self }
	end
	def waiters
		Waiter.all.select do | waiter |
			self.meals.any?{ |meal| meal.waiter == waiter}
		end
	end
end
