require 'rails_helper'

RSpec.describe "As a visitor" do 
  describe "when I visit a snack show page" do 
    it "then I see the name and price of the snack." do 
      owner = Owner.create!(name: "Sam's Snacks")
      dons  = owner.machines.create!(location: "Don's Mixed Drinks")
      cranapple = Snack.create!(name: "Cranapple", price: 1.00)
      crangrape = Snack.create!(name: "Crangrape", price: 1.50)
      cranpineapple = Snack.create!(name: "Cranpineapple", price: 2.00)
      MachineSnack.create!(machine: dons, snack: cranapple)
      MachineSnack.create!(machine: dons, snack: crangrape)
      MachineSnack.create!(machine: dons, snack: cranpineapple)

      visit snack_path(crangrape)

      expect(page).to have_content(crangrape.name)
      expect(page).to have_content(crangrape.price)
    end

    it "then I see the list of all locations with vending machines that carry that snack." do
      owner = Owner.create!(name: "Sam's Snacks")
      dons  = owner.machines.create!(location: "Don's Mixed Drinks")
      dans  = owner.machines.create!(location: "Dan's Vending Machines")
      cranapple = Snack.create!(name: "Cranapple", price: 1.00)
      crangrape = Snack.create!(name: "Crangrape", price: 1.50)
      cranpineapple = Snack.create!(name: "Cranpineapple", price: 2.00)
      MachineSnack.create!(machine: dons, snack: cranapple)
      MachineSnack.create!(machine: dons, snack: crangrape)
      MachineSnack.create!(machine: dans, snack: crangrape)
      MachineSnack.create!(machine: dons, snack: cranpineapple)

      visit snack_path(crangrape)

      expect(page).to have_content(dans.location)
      expect(page).to have_content(dons.location)
    end

    it "then I see the average price for snacks in that vending machine." do
      owner = Owner.create!(name: "Sam's Snacks")
      dons  = owner.machines.create!(location: "Don's Mixed Drinks")
      dans  = owner.machines.create!(location: "Dan's Vending Machines")
      cranapple = Snack.create!(name: "Cranapple", price: 1.00)
      crangrape = Snack.create!(name: "Crangrape", price: 1.50)
      cranpineapple = Snack.create!(name: "Cranpineapple", price: 2.00)
      MachineSnack.create!(machine: dons, snack: cranapple)
      MachineSnack.create!(machine: dons, snack: crangrape)
      MachineSnack.create!(machine: dans, snack: crangrape)
      MachineSnack.create!(machine: dons, snack: cranpineapple)

      visit snack_path(crangrape)

      expect(page).to have_content("$1.50")
    end

    xit "then I see the count for all different kinds of snacks in that vending machine." do 
    end
  end
end

# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
