puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."

5.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: %w[chinese italian japanese french belgian].sample,
    phone_number: Faker::PhoneNumber.phone_number
  )
  puts "Restaurant with id #{restaurant.id} was created"
end
puts "Finished!"
