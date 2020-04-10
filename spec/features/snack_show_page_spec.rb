require "rails_helper"

RSpec.describe "As a visitor" do
  context "when I visit a snack show page"do
    it "I see that snack's data" do
      sam = Owner.create(name: "Sam's Snacks")
      machine_1 = sam.machines.create(location: "My Apartment")
      machine_2 = sam.machines.create(location: "Turing Basement")

      snack_1 = machine_1.snacks.create( name: "Snickers",
                            price: 1.50)
      snack_2 = machine_1.snacks.create( name: "Milky Way",
                            price: 1.00)

      MachineSnack.create(machine: machine_2, snack: snack_1)

      machine_2.snacks.create( name: "Doritos",
                            price: 2.00)


      visit snack_path(snack_1)

      within "#description" do
        expect(page).to have_content("Snickers")
        expect(page).to have_content("1.50")
      end

      expect(page).to have_content("My Apartment (2 kinds of snacks, average price of $1.25)")
      expect(page).to have_content("Turing Basement (2 kinds of snacks, average price of $1.75)")
    end
  end
end


# User Story 3 of 3
#
# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
