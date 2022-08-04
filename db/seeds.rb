# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Company fields :name, :slogan, :rank, :ff_id, :members, :server

# t.string "username"
# t.string "email"
# t.string "password_digest"
# t.boolean "isAdmin"

if User.count == 0
    User.create(username: "Admin", email: "admin@admin.com", password: "admin", password_confirmation: "admin", isAdmin: true)
    User.create(username: "n00bsl4y3r", email: "seed1@seed.com", password: "123", password_confirmation: "123", isAdmin: false)
    User.create(username: "WarriorOfLight", email: "seed2@seed.com", password: "123", password_confirmation: "123", isAdmin: false)
    User.create(username: "IRLraidboss", email: "seed3@seed.com", password: "123", password_confirmation: "123", isAdmin: false)
end

if Category.count == 0
    Category.create(title: "Role-playing")
    Category.create(title: "Leveling")
    Category.create(title: "Casual")
    Category.create(title: "Hardcore")
    Category.create(title: "Dungeons")
    Category.create(title: "Guildhests")
    Category.create(title: "Trials")
    Category.create(title: "Raids")
    Category.create(title: "PvP")
end

if Company.count == 0
    Company.create(name: "Sparrow Glen", slogan: "Moments of clarity outside the box", rank: 30, ff_id:"9582749275018394720", members: 25, server: "Durandal [Gaia]")
    Company.create(name: "Majestic", slogan: "Fit for a king", rank: 12, ff_id:"8764334678909760929", members: 43, server: "Ragnarok [Chaos]")
    Company.create(name: "Yellow Submarine", slogan: "We are the walrus", rank: 30, ff_id:"9876545345658769656", members: 141, server: "Sargatenas [Aether]")
    Company.create(name: "Traitors", slogan: "Bottom's up, suckers", rank: 9, ff_id:"4357658787456465474", members: 53, server: "Aegis [Elemental]")
    Company.create(name: "eXileZ", slogan: "*teleports behind you* Nothing personell, kid.", rank: 24, ff_id:"7678886744565767756", members: 25, server: "Hyperion [Primal]")
    Company.create(name: "Intrepid Adventurers", slogan: "Powered by almonds", rank: 12, ff_id:"9785346576577567547", members: 7, server: "Excalibur [Primal]")
    Company.create(name: "13th Soldiers Regiment", slogan: "Live in the moment, protect the crown!", rank: 43, ff_id:"8778635654654675465", members: 40, server: "Balmung [Crystal]")
    Company.create(name: "Cloudforger", slogan: "Make a better world", rank: 20, ff_id:"2234566785456344345", members: 176, server: "Durandal [Gaia]")
    Company.create(name: "XIII", slogan: "Don't join", rank: 31, ff_id:"3424659735324235325", members: 98, server: "Phantom [Chaos]")
    Company.create(name: "Red Dot", slogan: "Aim straight", rank: 10, ff_id:"6578646323242679899", members: 32, server: "Malboro [Crystal]")
end

if CompanyCategory.count == 0
    50.times do
        CompanyCategory.create(company_id: rand(1..10), category_id: rand(1..9))
    end
end

if Review.count == 0
    Review.create(company_id: 3, text: "What a great fc!", rating: 5, user_id: 1)
    Review.create(company_id: 4, text: "PVP4LIEF", rating: 1, user_id: 2)
    Review.create(company_id: 7, text: "They were very helpful :)", rating: 3, user_id: 3)
    Review.create(company_id: 2, text: "Pretty good", rating: 4, user_id: 4)
    text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Congue quisque egestas diam in arcu. Ac feugiat sed lectus vestibulum mattis ullamcorper velit sed. Sed adipiscing diam donec adipiscing tristique risus nec feugiat. A erat nam at lectus urna duis convallis. Consectetur adipiscing elit ut aliquam purus sit amet. Sed odio morbi quis commodo odio aenean sed adipiscing diam. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Pellentesque habitant morbi tristique senectus et. Magna eget est lorem ipsum dolor sit amet consectetur. Tincidunt praesent semper feugiat nibh sed pulvinar proin. Lobortis mattis aliquam faucibus purus. Eget dolor morbi non arcu risus. Cursus eget nunc scelerisque viverra. Adipiscing commodo elit at imperdiet dui accumsan. Nunc scelerisque viverra mauris in aliquam sem. Dignissim enim sit amet venenatis urna cursus eget. Nibh nisl condimentum id venenatis a condimentum vitae. Massa enim nec dui nunc mattis enim ut. Eu scelerisque felis imperdiet proin fermentum. Ut venenatis tellus in metus vulputate eu scelerisque felis. Iaculis at erat pellentesque adipiscing commodo elit at. Lorem donec massa sapien faucibus et molestie. Nunc sed velit dignissim sodales ut eu sem integer vitae."
    arr = text.split(".")
    arr.each do |text|
        Review.create(company_id: rand(1..10), text: text, rating: rand(1..5), author: "Anonymous")
    end
end
