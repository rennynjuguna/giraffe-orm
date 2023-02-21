class Giraffe
  attr_accessor :name, :age, :height, :weight, :gender

  @@all = []

  def initialize(name, age, height, weight, gender)
    @name = name
    @age = age
    @height = height
    @weight = weight
    @gender = gender
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_giraffe(name, age, height, weight, gender)
    @@all << Giraffe.new(name, age, height, weight, gender)
  end
end

# the objects
g1 = Giraffe.new("George", 3, 12, 800, "male")
g2 = Giraffe.new("Gina", 4, 14, 1000, "female")
g3 = Giraffe.new("Greg", 5, 16, 1200, "male")
g4 = Giraffe.new_giraffe("Renny", 6, 10, 1600, "male")
g5 = Giraffe.new_giraffe("Alice", 10, 18, 1400, "female")

pp Giraffe.all

=begin
# @@all contents
Giraffe.all.each do |giraffe|
  puts "Name: #{giraffe.name}, Age: #{giraffe.age}, Height: #{giraffe.height}, Weight: #{giraffe.weight}, Gender: #{giraffe.gender}"
end
=end
