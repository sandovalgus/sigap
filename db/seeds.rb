# require 'csv'

# puts "Importing countries..."
# CSV.foreach(Rails.root.join("countries.csv"), headers: true) do |row|
#   Country.create! do |country|
#     country.id = row[0]
#     country.name = row[1]
#   end
# end

# puts "Importing states..."
# CSV.foreach(Rails.root.join("states.csv"), headers: true) do |row|
#   State.create! do |state|
#     state.name = row[0]
#     state.country_id = row[2]
#   end
# end

# puts "Importing cities..."
# CSV.foreach(Rails.root.join("cities.csv"), headers: true) do |row|
#   City.create! do |city|
#     city.name = row[0]
#     city.state_id = row[1]
#   end
# end


# - - - - Módulo Laboral - - - - 
# Importación de datos referente a la posición laboral 

# puts "Importing general directions..."
# CSV.foreach(Rails.root.join("general_directions.csv"), headers: true) do |row|
# 	GeneralDirection.create! do |general_direction|
# 		general_direction.name = row[0]
# 	end
# end

# puts "Importing directions..."
# CSV.foreach(Rails.root.join("directions.csv"), headers: true) do |row|
#   Direction.create! do |direction|
#     direction.name = row[0]
#     direction.general_direction_id = row[1]
#   end
# end

# puts "Importing departments..."
# CSV.foreach(Rails.root.join("departments.csv"), headers: true) do |row|
#   Department.create! do |department|
#     department.name = row[0]
#     department.direction_id = row[1]
#     department.general_direction_id = row[2]
#   end
# end


(1..100).each do |i|
  Employee.create!(
      legajo: Faker::Number.number(5) ,
      name: Faker::GameOfThrones.character,
      last_name: Faker::GameOfThrones.house,
      document_number: Faker::Number.number(8),
      email: Faker::Internet.email,
      date_of_admission: Faker::Date.backward(500),
      avatar:  Faker::Avatar.image("my-own-slug", "50x50", "jpg")

    )
end