require 'rails_helper'

RSpec.describe "When a user visits the snack show page", type: :feature do
  it "they see a list of names of prices of snacks at this machine" do
    sam = Owner.create!(name: "Sam's Snacks")
    jim = Owner.create!(name: "Jim's Jerkey")
    sam.machines.create!(location: "Don's Mixed Drinks")
    sam.machines.create!(location: "Ricks Reststop")
    jim.machines.create!(location: "Jims Jerkey")

    snack1 = sam.machines.first.snacks.create!(name: "Doritos", price: 2.99)
    snack2 = sam.machines.first.snacks.create!(name: "Cheetos", price: 1.99)

    sam.machines.last.snacks << snack1
    sam.machines.last.snacks << snack2
    jim.machines.first.snacks << snack1

    visit snack_path(snack1)
    expect(current_path).to eq("/snacks/#{snack1.id}")
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Ricks Reststop")
    expect(page).to have_content("Jims Jerkey")


  end
end

# User Story 3 of 3
# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
# ```
