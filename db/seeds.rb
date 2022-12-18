# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
GEODATA = ["913-14 Jogasawa, Mutsu shi, Aomori ken",
           "507-12 Uchikanna, Chita gun taketoyo cho, Aichi ken",
           "611-3 Nikkocho, Moriguchi shi, Osaka fu",
           "710-16 Miirakumachi fuchinomoto, Goto shi, Nagasaki ken",
           "965-10 Sanjocho, Ashiya shi, Hyogo ken",
           "996-8 Oba, Hitachiomiya shi, Ibaraki ken",
           "814-10 Kuchida, Chita gun taketoyo cho, Aichi ken",
           "58-18 Katsumotocho nakafure, Iki shi, Nagasaki ken",
           "838-14 Kumanogawacho nishi, Shingu shi, Wakayama ken",
           "686-18 Atago hamamachi, Maizuru shi, Kyoto fu",
           "615-20 Sakuramachi, Miyazaki shi, Miyazaki ken",
           "72-12 Takazumi, Iwami gun iwami cho, Tottori ken",
           "704-2 Nakasonecho, Okinawa shi, Okinawa ken",
           "12-13 Ogawa, Tone gun minakami machi, Gumma ken",
           "833-18 Ishidamachi, Nobeoka shi, Miyazaki ken",
           "3-589-7 Kuminoki, Osakasayama shi, Osaka fu",
           "989-8 Tomizawa, Soma shi, Fukushima ken",
           "734-1 Katagihara sugiharacho, Kyoto shi nishikyo ku, Kyoto fu",
           "464-18 Mitsuyamotocho, Nagahama shi, Shiga ken",
           "201-10 Soryocho inakusa, Shobara shi, Hiroshima ken",
           "1-291-8 Sarugakucho, Chiyoda ku, Tokyo to",
           "629-10 Nishikikyocho, Hakodate shi, Hokkaido",
           "626-6 Ogi, Kikuchi shi, Kumamoto ken",
           "832-3 Fukuyoshi, Tohaku gun misasa cho, Tottori ken",
           "423-16 Yakushiji, Shimotsuke shi, Tochigi ken",
           "753-13 Namioka shimoishikawa, Aomori shi, Aomori ken",
           "753-4 Oasa takamachi, Ebetsu shi, Hokkaido",
           "110-5 Kamimikusa, Kato shi, Hyogo ken",
           "155-13 Higashifuruichiba, Kawasaki shi saiwai ku, Kanagawa ken",
           "711-11 Kurahashicho, Kure shi, Hiroshima ken",
           "356-3 Muyacho kizu, Naruto shi, Tokushima ken",
           "354-20 Awacho inari, Awa shi, Tokushima ken",
           "567-1 Misakacho ninomiya, Fuefuki shi, Yamanashi ken",
           "141-10 Ichibu, Kuma gun nishiki machi, Kumamoto ken",
           "755-16 Omagari midoricho, Daisen shi, Akita ken",
           "133-17 Irio, Nyu gun echizen cho, Fukui ken",
           "18-17 Uwamachi, Odate shi, Akita ken",
           "690-17 Tonemachi okkai, Numata shi, Gumma ken",
           "614-10 Takegaki, Chikusei shi, Ibaraki ken",
           "832-10 Matsuo dairicho, Kyoto shi nishikyo ku, Kyoto fu",
           "189-8 Minamiabuzaka, Tokamachi shi, Niigata ken",
           "695-16 Saidaiji gomyo, Okayama shi higashi ku, Okayama ken",
           "229-5 Higashimachi, Iwakura shi, Aichi ken"]

puts "clearing the database"

User.destroy_all

puts "creating admin Users..."
USERS= [
  {
  full_name: "Joyce",
  email: "joyce@example.com",
  password: "Password123",
  role_type: "teacher",
  admin: true,
  },
  {
  full_name: "Hafid",
  email: "hafid@example.com",
  password: "Password123",
  role_type: "teacher",
  admin: true,
  },
  {
  full_name: "Fred",
  email: "fred@example.com",
  password: "Password123",
  role_type: "teacher",
  admin: true,
  }
]
USERS.each do |user_acc|
  new_user = User.new(user_acc)
  new_user.save!
end
puts "Teachers created successfully"

puts "creating Parents..."

10.times do |index|
User.create!(
email: "parent#{index + 1}@example.com", 
role_type: "parent" ,
full_name: Faker::Name.name ,
password: "Password123"
)
end

puts "Parents created successfully"

puts "creating drivers... "
2.times do |index|
User.create!(
email: "driver#{index + 1}@example.com", 
role_type: "driver",
full_name: Faker::Name.name ,
password: "Password123"
)
end

puts "drivers created successfully"


puts "creating children... "

20.times do |index|
child = Child.new(
 full_address: GEODATA.sample,
 full_name: Faker::Name.name ,
 birthday: DateTime.current.to_date  - (rand(6..15) * 100) ,
)
child.parent = User.where(role_type: "parent").sample
child.save!
end

puts "children created successfully"

puts "creating trips... "

20.times do |index|
child = Child.new(
 full_address: GEODATA.sample,
 full_name: Faker::Name.name ,
 birthday: DateTime.current.to_date  - (rand(6..15) * 100) ,
)
child.parent = User.where(role_type: "parent").sample
child.save!
end

puts "trips created successfully"

