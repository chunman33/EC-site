# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者ログイン情報
Admin.create!(
   email: "a@a",
   password: "aaaaaa"
)


#一つずつ作成
Genre.create(name: "ケーキ")
Genre.create(name: "プリン")

# まとめて作成
Genres = Genre.create!([
    {name: "焼き菓子"}, 
    {name: "チョコ"},
    {name: "タルト"}
])




5.times do |n|
 Item.create!(
   name: "test#{n+1}",
   description: "testtesttest#{n+1}",
   sale_status: "true",
   genre_id: Genre.find(n+1).id,
   excluding_tax_price: 1000,
   )
end

Item.create!(name: "販売停止テスト", description: "販売停止の挙動をテストします。", sale_status: "false", genre_id: Genre.find(2).id, excluding_tax_price: 1000)


