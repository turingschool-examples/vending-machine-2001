# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


    @sam = Owner.create!(name: "Sam's Snacks")
    @machine1 = @sam.machines.create!(location: "Don's Mixed Drinks")
    @machine2 = @sam.machines.create!(location: "Turing School")
    @machine3 = @sam.machines.create!(location: "Walmart")
    @snack1 = Snack.create!(name: "Kool-Aid", price: 1.00)
    @snack2 = Snack.create!(name: "Fruit Punch", price: 1.50)
    @snack3 = Snack.create!(name: "Sweet Tea", price: 2.00)

    SnackMachine.create!(snack_id: @snack1.id, machine_id: @machine1.id)
    SnackMachine.create!(snack_id: @snack2.id, machine_id: @machine1.id)
    SnackMachine.create!(snack_id: @snack3.id, machine_id: @machine1.id)
    SnackMachine.create!(snack_id: @snack1.id, machine_id: @machine2.id)
    SnackMachine.create!(snack_id: @snack2.id, machine_id: @machine2.id)
    SnackMachine.create!(snack_id: @snack1.id, machine_id: @machine3.id)
