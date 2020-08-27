# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(email:'admins@test.com',password:'tester')
Type.create!(name: 'シェイカー', invalid_status: true)
Product.create!( name: 'バーテンダーセット', type_id: 1, introduction: 'お家でバーテンダーになれます', price_excluding: 3000, out_of_stock: true)
Product.create!( name: 'バーテンダーセット1', type_id: 1, introduction: 'お家でバーテンダーになれます!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11111111111111111111111', price_excluding: 3000, out_of_stock: false)
Product.create!( name: 'バーテンダーセット2', type_id: 1, introduction: 'お家でバーテンダーになれます', price_excluding: 3000, out_of_stock: false)
Product.create!( name: 'バーテンダーセット3', type_id: 1, introduction: 'お家でバーテンダーになれます', price_excluding: 3000, out_of_stock: false)
Product.create!( name: 'バーテンダーセット4', type_id: 1, introduction: 'お家でバーテンダーになれます', price_excluding: 3000, out_of_stock: false)
Product.create!( name: 'バーテンダーセット3', type_id: 1, introduction: 'お家でバーテンダーになれます', price_excluding: 3000, out_of_stock: false)