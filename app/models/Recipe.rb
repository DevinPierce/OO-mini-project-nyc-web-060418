class Recipe

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def add_ingredients(array)
    array.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def ingredients
    array = RecipeIngredient.all.select {|ri| ri.recipe == self}
    array.map {|ri| ri.ingredient}
  end

  def users
    array = RecipeCard.all.select {|rc| rc.recipe == self}
    array.map {|rc| rc.user}
  end

  def self.most_popular
    array = RecipeCard.all.map {|rc| rc.recipe}
    count_hash = Hash.new(0)
    array.flatten.each {|recipe| count_hash[recipe] += 1}
    highest = 0
    hightest_object = nil
    count_hash.each do |key, value|
      if value > highest
        highest = value
        hightest_object = key
      end
    end
    hightest_object
  end

  def allergens
    self.ingredients.any? do |ingredient|
      check_allergens(ingredient)
    end
  end

  def check_allergens(ingredient)
    Allergen.all.any? {|allergen| allergen.ingredient == ingredient}
  end

end
