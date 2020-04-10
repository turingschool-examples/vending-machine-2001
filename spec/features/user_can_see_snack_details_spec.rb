require 'rails_helper'

RSpec.describe "When a user visits a snack show page", type: :feature do
  it "sees details about the snack" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    turing  = owner.machines.create(location: "Turing Basement")
    burger = dons.snacks.create!(name: "White Castle Burger",
                                price: 3.50)
    poprocks = dons.snacks.create!(name: "Pop Rocks",
                                price: 1.50)
    cheetos = dons.snacks.create!(name: "Flaming Hot Cheetos",
                                price: 2.50)

    SnackMachine.create!(snack: cheetos, machine: turing)
    SnackMachine.create!(snack: poprocks, machine: turing)                                   

    visit "/snacks/#{cheetos.id}"

    expect(page).to have_content("Flaming Hot Cheetos")
    expect(page).to have_content("Price: 2.50")
    expect(page).to have_content("Locations")
    expect(page).to have_content("Don's Mixed Drinks (3 kinds of snacks, average price of $2.50)")
    expect(page).to have_content("Turing Basement (2 kinds of snacks, average price of $2.00)")
  end
end
