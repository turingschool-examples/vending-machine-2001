require 'rails_helper'

RSpec.describe "When a user visits the snack show page", type: :feature do
  it "they see a list of names of prices of snacks at this machine" do
    sam = Owner.create!(name: "Sam's Snacks")
    jim = Owner.create!(name: "Jim's Jerkey")
    sam.machines.create!(location: "Don's Mixed Drinks")
    sam.machines.first.snacks.create!(name: "Doritos", price: 2.99)
    sam.machines.first.snacks.create!(name: "Cheetos", price: 1.99)
    sam.machines.first.snacks.create!(name: "Fritos", price: 1.59)



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
