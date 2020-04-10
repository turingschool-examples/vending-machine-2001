require 'rails_helper'

RSpec.describe "As a visitor" do
  context "when I visit a vending machine show page" do
    it "I see the name of all of the snacks associated with that vending machine along with their price" do
      sam = Owner.create(name: "Sam's Snacks")
      machine = sam.machines.create(location: "Turing Basement")

      snack_1 = machine.snacks.create( name: "Snickers",
                            price: 1.50)
      snack_2 = machine.snacks.create( name: "Milky Way",
                            price: 1.00)

      visit machine_path(machine)

      within "snack-#{snack_1.id}" do
        expect(page).to have_content("Snickers")
        expect(page).to have_content("1.50")
      end

      within "snack-#{snack_1.id}" do
        expect(page).to have_content("Milky Way")
        expect(page).to have_content("1.00")
      end

    end
  end
end

# User Story 1 of 3
#
# As a visitor
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price
