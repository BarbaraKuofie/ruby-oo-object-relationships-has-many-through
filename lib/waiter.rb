class Waiter
    attr_accessor :name, :yrs_experience 

    @@all = []

    def initialize(name, yrs_experience)
        @name = name 
        @yrs_experience = yrs_experience
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

# this is to create a new meal for the waiter
# since we're in the waiter class we can pass in an instance of itself as the waiter
    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end 

    ## this is to find the meals where the waiter is this waiter instance 
    def meals 
        Meal.all.select do |meal|
            meal.waiter == self 
        end 
    end 

# this is to find the customer who tips the best 
    def best_tipper 
       best_tipped_meal = meals.max do |meal_a, meal_b|
        meal_a.tip <=> meal_b.tip
        end 
        best_tipped_meal.customer
    end 

    # another way of writing the above 
    # def best_tipper
    #meals.max{|meal_a, meal_b| meal_a.tip <=> meal_b.tip}.customer

## this is to find the most frequent customer 
    def most_frequent_customer 
        counter = self.meals.customer.count 
        Meal.all.sort_by{|meals|meals.customer.counter}.last 
    end 

    def worst_tipper 
        meals.min{|meal_a, meal_b| meal_a.tip <=> meal_b.tip}.customer 
    end

end