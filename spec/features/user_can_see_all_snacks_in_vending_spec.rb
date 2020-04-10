require 'rails_helper'

RSpec.describe "When a user visits the vending machine show page", type: :feature do
  scenario "they see a list of vending machine snacks" do
    sam = Owner.create(name: "Sam's Snacks")
    dons = sam.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: 'cheese sticks', price: 1.50)
    dons.snacks.create(name: 'Chips n Dip', price: 3.00)

    visit machine_path(dons)

    expect(page).to have_content("cheese sticks: $1.50")
    expect(page).to have_content("Chips n Dip: $3.00")
  end

  scenario "they see a list of vending machine snacks" do
    sam = Owner.create(name: "Sam's Snacks")
    dons = sam.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: 'cheese sticks', price: 1.50)
    dons.snacks.create(name: 'Chips n Dip', price: 3.50)
    dons.snacks.create(name: "Hot Pockets", price: 2.50)

    visit machine_path(dons)

    expect(page).to have_content("Average Price: $2.50")

  end
end
