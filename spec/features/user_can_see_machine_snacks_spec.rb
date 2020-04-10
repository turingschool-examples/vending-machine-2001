require 'rails_helper'

RSpec.describe "When a user visits a vending machine show page", type: :feature do
  it "sees a list of all snacks associated with that vending machine and their prices" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    burger = dons.snacks.create!(name: "White Castle Burger",
                                price: 3.50)
    poprocks = dons.snacks.create!(name: "Pop Rocks",
                                price: 1.50)
    cheetos = dons.snacks.create!(name: "Flaming Hot Cheetos",
                                price: 2.00)

    visit "/machines/#{dons.id}"

    expect(page).to have_content("White Castle Burger: $3.50")
    expect(page).to have_content("Pop Rocks: $1.50")
    expect(page).to have_content("Flaming Hot Cheetos: $2.00")                                                         

  end
end
