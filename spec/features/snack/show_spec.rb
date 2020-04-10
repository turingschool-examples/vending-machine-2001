require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do
  it "can show the name of the snack and the price for that snack" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    pretzels = dons.snacks.create(name: "Pretzels", price: 2)
    MachineSnack.create(machine: dons, snack: pretzels)

    visit "/snacks/#{pretzels.id}"

    expect(page).to have_content("Pretzels Price: $#{pretzels.price}.00")
  end
  it "can show all the locations where that snack is sold" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    bobs  = owner.machines.create(location: "Bob's Restaurant")

    pretzels = dons.snacks.create(name: "Pretzels", price: 2)
    pretzels = bobs.snacks.create(name: "Pretzels", price: 3)
    MachineSnack.create(machine: dons, snack: pretzels)
    MachineSnack.create(machine: bobs, snack: pretzels)

    visit "/snacks/#{pretzels.id}"
    expect(page).to have_content("Locations: Don's Mixed Drinks Bob's Restaurant")

  end
end
# Locations
# * Don's Mixed Drinks (3 kinds of snacks, average
# # Flaming Hot Cheetos
# Price: $2.50

  # User Story 3 of 3
  # ​
  # As a visitor
  # When I visit a snack show page
  # I see the name of that snack
  #   and I see the price for that snack
  #   and I see a list of locations with vending machines that carry that snack
  #   and I see the average price for snacks in those vending machines
  #   and I see a count of the different kinds of items in that vending machine.
