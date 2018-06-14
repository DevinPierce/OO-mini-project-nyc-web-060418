class Ingredient

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    allergies = []
    User.all.each do |user|
      allergies << user.allergens
    end
    count_hash = Hash.new(0)
    allergies.flatten.each {|ingredient| count_hash[ingredient] += 1}
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

end
