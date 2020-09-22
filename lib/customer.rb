class Customer
  attr_accessor :name, :age 

    @@all = []
    
    def initialize(name, age)
        @name = name 
        @gae = age 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    ## this is to create a new meal 
    ## we don't need to pass in a customer because we're passing in self 
    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end 

## this is a way for the custeomer and waiter to get information about each other 
# custermer instance will look at all the meals and select the ones that belong to them
## meals belong to...  
    def meals
        Meal.all.select do |meal|
            meal.customer == self 
        end 
    end 

## this will tell the customer who their waiters are for all meals
## reusing meals method, since we can isolate the meals to the customer 
    def waiters
        meals.map do |meal|
            meal.waiter
        end 
    end 

# to get this customer's last waiter 
    def last_waiter 
        self.waiters.last.name 
    end 

end