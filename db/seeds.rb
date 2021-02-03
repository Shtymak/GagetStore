# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do
  product = Product.create({
                             name: Faker::Food.dish,
                             description: Faker::Food.description,
                             price: rand(100)
                           })
  product.image.attach(io: URI.open('https://picsum.photos/300'), filename: "#{product.name}.jpg",
                       content_type: 'image/jpg')
end
