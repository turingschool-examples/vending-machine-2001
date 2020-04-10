require 'rails_helper'

RSpec.describe "When a user visits the snack show page", type: :feature do
  scenario "they see a list of vending machines" do
    sam = Owner.create(name: "Sam's Snacks")
    machine1 = sam.machines.create(location: "Don's Mixed Drinks")

    machine1.snacks.create(name: 'Chips n Dip', price: 3.50)
    machine1.snacks.create(name: "Hot Pockets", price: 2.50)
    machine2 = sam.machines.create(location: "Turing Basement")
    machine2.snacks.create(name: "Hot Pockets", price: 2.50)
    snack = Snack.create(name: "Cheese Sticks", price: 1.00)
    MachineSnack.create(machine: machine1, snack: snack)
    MachineSnack.create(machine: machine2, snack: snack)

    visit "/snacks/#{snack.id}"
    expect(page).to have_content("#{snack.name}")
    expect(page).to have_content("Price: $#{snack.price}")
    expect(page).to have_content("#{machine1.location} (3 kinds of snacks, average price of $2.33)")
    expect(page).to have_content("#{machine2.location} (2 kinds of snacks, average price of $1.75)")
  end
end
