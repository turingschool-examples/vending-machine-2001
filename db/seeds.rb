# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sam = Owner.create!(name: "Sam's Snacks")
drinks = sam.machines.create!(location: "Don's Mixed Drinks")
snack1 = Snack.create!(name: "Kool-Aid", price: 1)
snack2 = Snack.create!(name: "Fruit Punch", price: 1.5)
snack3 = Snack.create!(name: "Sweet Tea", price: 2)

SnackMachine.create!(snack_id: snack1.id, machine_id: drinks.id)
SnackMachine.create!(snack_id: snack2.id, machine_id: drinks.id)
SnackMachine.create!(snack_id: snack3.id, machine_id: drinks.id)
