require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  it "can show me all the snacks associated with that machine and their price" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    pretzels = dons.snacks.create(name: "Pretzels", price: 2)
    chips = dons.snacks.create(name: "Tasty Chips", price: 3)

    MachineSnack.create(machine: dons, snack: pretzels)
    MachineSnack.create(machine: dons, snack: chips)

    visit "/machines/#{dons.id}"
    expect(page).to have_content("Pretzels: $2.00")
    expect(page).to have_content("Tasty Chips: $3.00")
  end
  it "can show an average price for all the snacks in the machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    pretzels = dons.snacks.create(name: "Pretzels", price: 2)
    chips = dons.snacks.create(name: "Tasty Chips", price: 3)

    MachineSnack.create(machine: dons, snack: pretzels)
    MachineSnack.create(machine: dons, snack: chips)

    visit "/machines/#{dons.id}"
    expect(page).to have_content("Average Price: $#{dons.average_price}")
  end
end
# Snacks
# * White Castle Burger: $3.50
# * Pop Rocks: $1.50
# * Flaming Hot Cheetos: $2.50
# Average Price: $2.50

# User Story 2 of 3
# ​
# As a visitor
# When I visit a vending machine show page
# I also see an average price for all of the snacks in that machine

# User Story 1 of 3
# ​
# As a visitor
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price
