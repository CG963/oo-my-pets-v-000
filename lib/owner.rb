require "pry"

class Owner

  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def species(species = "human")
    @species = species
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select { |name| name.owner == self }
  end
  
  def dogs
    Dog.all.select { |name| name.owner == self }
  end

  def buy_cat(cat)
    new_cat = Cat.new(cat, self)
  end
  
  def buy_dog(dog)
    new_dog = Dog.new(dog, self)
  end

  def walk_dogs
    Dog.all.each {|x| x.mood = "happy"}
  end

  def feed_cats
    Cat.all.each {|x| x.mood = "happy"}
  end

  def sell_pets
    Dog.all.each {|x| x.mood = "nervous"}
    Cat.all.each {|x| x.mood = "nervous"}
    Dog.all.each {|x| x.owner = nil}
    Cat.all.each {|x| x.owner = nil}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end
