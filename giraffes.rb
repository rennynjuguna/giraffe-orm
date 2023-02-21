require 'sqlite3'

class Giraffe
  attr_accessor :name, :age, :height, :weight, :gender

  @@db = SQLite3::Database.new('giraffes.db')

  def initialize(name, age, height, weight, gender)
    @name = name
    @age = age
    @height = height
    @weight = weight
    @gender = gender
  end

  def self.all
    rows = @@db.execute("SELECT * FROM giraffes")
    rows.map do |row|
      Giraffe.new(row[0], row[1], row[2], row[3], row[4])
    end
  end

  def save
    @@db.execute("INSERT INTO giraffes (name, age, height, weight, gender) VALUES (?, ?, ?, ?, ?)",
                 @name, @age, @height, @weight, @gender)
  end

  def self.create(name, age, height, weight, gender)
    giraffe = Giraffe.new(name, age, height, weight, gender)
    giraffe.save
    giraffe
  end

  def self.db
    @@db
  end
end

# create the giraffes table
Giraffe.db.execute("CREATE TABLE IF NOT EXISTS giraffes (name TEXT PRIMARY KEY, age INTEGER, height INTEGER, weight INTEGER, gender TEXT)")

# test the Giraffe class

Giraffe.create("Melvyn", 10, 18, 1600, "male")
Giraffe.create("Gloria", 8, 16, 1200, "female")
Giraffe.create("Rennie", 9, 17, 1400, "male")
Giraffe.create("Judy", 10, 14, 1250, "female")
Giraffe.create("Alice", 12, 16, 1450, "female")
Giraffe.create("Sasuke", 9, 15, 1280, "male")
Giraffe.create("John", 12, 16, 1450, "male")
Giraffe.create("Cena", 9, 15, 1280, "male")

puts Giraffe.all
