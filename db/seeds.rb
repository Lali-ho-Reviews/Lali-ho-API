# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Company fields :name, :slogan, :rank, :ff_id, :members, :server
if Company.count == 0
    Company.create(name: "Dungeon Dudes", slogan: "We delve for our selves!", rank: 30, ff_id:"3335454353453", members: 25, server: "Pheonix")
    Company.create(name: "Roleplay Rastafarians", slogan: "Here to have a good time, and dance on tables", rank: 15, ff_id:"23567856435", members: 420, server: "Shiba")
    Company.create(name: "PK 4 LIFE", slogan: "Eat trash, beat trash. SIT KID", rank: 30, ff_id:"887654364354", members: 99, server: "Fantasy Oxen")
    Company.create(name: "Sprout Support", slogan: "We almost called ourselves Brawndo, because we're what plants crave.", rank: 25, ff_id:"9045655234356634", members: 125, server: "Anime-word")
end