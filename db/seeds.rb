# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
products = Product.create([{name: "iPhone 8", description: "128GB, Space gray", image: "https://cdn.x-kom.pl/i/setup/images/prod/big/product-big,apple-iphone-xr-64gb-black-448356,2018/9/pr_2018_9_13_9_1_32_809_00.jpg"},
  {name: "Huawei P20", description: "128 GB, Twilight blue", image:"https://f01.esfr.pl/foto/8/28564391577/d208a39d51642bba36273e5595debbeb/huawei-p20-lite-niebieski,28564391577_7.jpg"},
  {name: "Samsung S9", description: "Fioletowy", image:"https://ecsmedia.pl/c/smartfon-samsung-galaxy-s9-64-gb-single-sim-w-iext53461781.jpg"}])


user = User.new(
  email: 'user@test.com',
  password: '123456789',
  password_confirmation: '123456789'
)
user.save!

user = User.new(
  email: 'user2@test.com',
  password: '123456789',
  password_confirmation: '123456789'
)
user.save!
rates = Rate.create([
  {value: 4, comment:"Świetny produkt", user_id:1, product_id: 20},
  {value: 5, comment:"Jestem zachwycony", user_id:2, product_id: 22},
  {value: 3, comment:"Takji sobie", user_id:1, product_id: 21},
  {value: 1, comment:"Dno.", user_id:2, product_id: 22},
  {value: 3, comment:"OK", user_id:1, product_id: 21},
  {value: 2, comment:"Nie polecam", user_id:2, product_id: 20},
  {value: 5, comment:"Świetny produkt", user_id:1, product_id: 21}
  ])
