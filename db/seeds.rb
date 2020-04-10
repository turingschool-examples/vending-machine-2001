# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
owner1 = Owner.create(name: "Sam's Snacks")
owner2 = Owner.create(name: "Bob B.")

dons  = owner1.machines.create(location: "Don's Mixed Drinks")
bobs  = owner2.machines.create(location: "Bob's Corner Store")

snack1 = Snack.create(name: "Hot Cheetos", price: 1.50)
snack2 = Snack.create(name: "Takis", price: 1.75)
snack3 = Snack.create(name: "Hot Fries", price: 1.25)

dons.snacks << [snack1, snack2, snack3]
bobs.snacks << snack1
