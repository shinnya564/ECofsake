# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(email:'admins@test.com',password:'tester')
# EndUser.create!(email:'test@test',password:'tester',family_name:'test',first_name:'tester',kana_family_name:'テスト',kana_first_name:'テスター',postal_code:'1111111',address:'東京都テスト',tel:'00000000000',delete_status:false)

Admin.create!(
  id: 0,
  email: 'admins@test.com',
  password: 'tester'
)

EndUser.create!(
  id: 0,
  email: 'test@test',
  password: 'tester',
  family_name: 'test',
  first_name: 'tester',
  kana_family_name: 'テスト',
  kana_first_name: 'テスター',
  postal_code: '1111111',
  address: '東京都テスト',
  tel: '00000000000',
  delete_status: false
)

10.times do |_n|
  name1 = Faker::Job.title
  Type.create!(name: name1,
               invalid_status: true)
end

20.times do |n|
  name2 = Faker::Job.unique.title
  introduction = Faker::Number.number(digits: 1000)
  id = Random.new
  price = Faker::Number.number(digits: 4)
  Product.create!(name: name2,
                  type_id: id.rand(10) + 1,
                  introduction: introduction,
                  price_excluding: price,
                  out_of_stock: false)
  20.times do |_t|
    title = Faker::Job.unique.title
    name4 = Faker::Games::Pokemon.name
    introduction = Faker::Number.number(digits: 100)
    price = Faker::Number.number(digits: 4)
    ProductComment.create!(product_id: n + 1,
                           name: name4,
                           comment: introduction)
  end
end

20.times do |n|
  title = Faker::Job.unique.title
  name3 = Faker::Games::Pokemon.name
  introduction = Faker::Number.number(digits: 1000)
  BulletinBoard.create!(title: title,
                        name: name3,
                        body: introduction)

  20.times do |_t|
    title = Faker::Job.unique.title
    name4 = Faker::Games::Pokemon.name
    introduction = Faker::Number.number(digits: 100)
    price = Faker::Number.number(digits: 4)
    BulletinBoardComment.create!(bulletin_board_id: n + 1,
                                 name: name4,
                                 comment: introduction)
  end
end

20.times do |n|
  name2 = Faker::Job.unique.title
  introduction = Faker::Number.number(digits: 1000)
  id = Random.new
  price = Faker::Number.number(digits: 4)
  Product.create!(name: name2,
                  type_id: id.rand(10) + 1,
                  introduction: introduction,
                  price_excluding: price,
                  out_of_stock: false)
  20.times do |_t|
    title = Faker::Job.unique.title
    name4 = Faker::Games::Pokemon.name
    introduction = Faker::Number.number(digits: 100)
    price = Faker::Number.number(digits: 4)
    ProductComment.create!(product_id: n + 1,
                           name: name4,
                           comment: introduction)
  end
end
