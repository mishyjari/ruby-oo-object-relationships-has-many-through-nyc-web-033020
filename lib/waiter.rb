class Waiter
	@@all = []
	attr_accessor :name, :experience
	def initialize (name,experience)
		@name = name
		@experience = experience
		Waiter.all << self
	end
	def self.all
		@@all
	end
	def new_meal(customer,total,tip)
		Meal.new(self,customer,total,tip)
	end
	def meals
		Meal.all.select{ |meal| meal.waiter == self }
	end
	def best_tipper
		Meal.all.max{ |a,b| a.tip <=> b.tip }.customer
	end
end
