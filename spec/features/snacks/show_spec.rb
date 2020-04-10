require 'rails_helper'

RSpec.describe "snack show page" do
  context "as a visitor" do
    it "can see name and price of that snack" do

        bob = Owner.create(name: "Bob")
        vending1 = bob.machines.create(location: "Bowling Alley")
        vending2 = bob.machines.create(location: "Dive Bar")
        vending3 = bob.machines.create(location: "Barber Shop")
        snack1 = Snack.create(name: "Doritos", price: 2)
        snack2 = Snack.create(name: "Snickers", price: 4)
        snack3 = Snack.create(name: "Cookies", price: 6)
        snack4 = Snack.create(name: "Crackers", price: 2)
        snack5 = Snack.create(name: "Gum", price: 8)
        snack6 = Snack.create(name: "Skittles", price: 4)
        MachineSnack.create(machine: vending1, snack: snack1, amount: 1)
        MachineSnack.create(machine: vending2, snack: snack1, amount: 2)
        MachineSnack.create(machine: vending3, snack: snack1, amount: 3)
        MachineSnack.create(machine: vending1, snack: snack4, amount: 3)
        MachineSnack.create(machine: vending2, snack: snack5, amount: 3)
        MachineSnack.create(machine: vending2, snack: snack6, amount: 3)

        visit snack_path(snack1)

        expect(page).to have_content(snack1.name) 
        expect(page).to have_content(snack1.price) 
      
    end

    it "can see locations with average snack price and count of different items" do

        bob = Owner.create(name: "Bob")
        vending1 = bob.machines.create(location: "Bowling Alley")
        vending2 = bob.machines.create(location: "Dive Bar")
        vending3 = bob.machines.create(location: "Barber Shop")
        snack1 = Snack.create(name: "Doritos", price: 2)
        snack2 = Snack.create(name: "Snickers", price: 4)
        snack3 = Snack.create(name: "Cookies", price: 6)
        snack4 = Snack.create(name: "Crackers", price: 4)
        snack5 = Snack.create(name: "Gum", price: 8)
        snack6 = Snack.create(name: "Skittles", price: 4)
        MachineSnack.create(machine: vending1, snack: snack1, amount: 1)
        MachineSnack.create(machine: vending2, snack: snack1, amount: 2)
        MachineSnack.create(machine: vending3, snack: snack1, amount: 3)
        MachineSnack.create(machine: vending1, snack: snack4, amount: 3)
        MachineSnack.create(machine: vending2, snack: snack5, amount: 3)
        MachineSnack.create(machine: vending2, snack: snack6, amount: 3)

        visit snack_path(snack1)

        expect(page).to have_content("Available at: Bowling Alley") 
        expect(page).to have_content("Average snack price is $3.00") 
        expect(page).to have_content("Number of different snacks: 2") 
        
save_and_open_page
      
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