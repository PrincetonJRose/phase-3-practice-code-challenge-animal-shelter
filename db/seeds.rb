puts 'Clearing the database...'

Shelter.destroy_all
Pet.destroy_all
Adopter.destroy_all

puts 'Database cleared!'

puts 'Creating a place to shelter those looking for a home... 🐕'

5.times do
    Shelter.find_or_create_by( name: Faker::Address.community + ' Center', address: Faker::Address.full_address )
end

puts 'Shelters constructed!'

puts 'Finding willing adopters...'

20.times do
    Adopter.find_or_create_by( first_name: Faker::Name.first_name, last_name: Faker::Name.last_name )
end

puts 'Adopters ready to adopt!'

puts 'Finding adorable lost animals...'
10.times do

    name = ''
    species = ''
    species_num = rand(0..1)
    species_num == 1 ? name = Faker::Creature::Cat.name : name = Faker::Creature::Dog.name
    species_num == 1 ? species = 'Cat' : species = 'Dog'

    Pet.find_or_create_by( name: name, age: rand(1..5), species: species , adopted?: false, shelter: Shelter.all.sample )
end

puts 'Animals are waiting to be adopted!'

puts 'Done!'