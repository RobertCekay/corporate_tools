require_relative "dino_management"

dinos = [
  {
    "name" => "DinoA",
    "category" => "herbivore",
    "period" => "Cretaceous",
    "diet" => "plants",
    "age" => 100
  },
  {
    "name" => "DinoB",
    "category" => "carnivore",
    "period" => "Jurassic",
    "diet" => "meat",
    "age" => 80
  }
]

puts DinoManagement.run(dinos)