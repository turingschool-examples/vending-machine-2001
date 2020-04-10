# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Owner.destroy_all
Machine.destroy_all
Snack.destroy_all

owner1 = Owner.create(name: "Sam's Snacks")
owner2 = Owner.create(name: "Drew's Drinks")
machine1 = owner1.machines.create(location: "Don's Mixed Drinks")
machine2 = owner2.machines.create(location: "Turing Basement")
machine3 = owner2.machines.create(location: "Drew's shop")
snack1 = machine1.snacks.create(name: 'Cheese Sticks', price: 1.50)
snack2 = machine1.snacks.create(name: 'Chips n Dip', price: 3.50)
snack3 = machine1.snacks.create(name: "Hot Pockets", price: 2.50)
MachineSnack.create(machine: machine2, snack: snack1)
MachineSnack.create(machine: machine2, snack: snack2)
MachineSnack.create(machine: machine3, snack: snack2)
MachineSnack.create(machine: machine3, snack: snack3)
