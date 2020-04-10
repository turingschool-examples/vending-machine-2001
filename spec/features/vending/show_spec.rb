require 'rails_helper'

RSpec.describe "vending machine show page" do
    describe "as a visitor" do
        it "can the name of all snacks associated with that machine and their prices" do
            
            bob = Owner.create(name: "Bob")
            vending1 = bob.machines.create(location: "Bowling Alley")
            snack1 = Snack.create(name: "Doritos", price: 2)
            snack2 = Snack.create(name: "Snickers", price: 1)
            snack3 = Snack.create(name: "Cookies", price: 4)
            MachineSnack.create(machine: vending1, snack: snack1, amount: 1)
            MachineSnack.create(machine: vending1, snack: snack2, amount: 2)
            MachineSnack.create(machine: vending1, snack: snack3, amount: 3)

            visit machine_path(vending1)

            expect(page).to have_content(snack1.name)
            expect(page).to have_content(snack1.price)
            expect(page).to have_content(snack2.name)
            expect(page).to have_content(snack2.price)
            expect(page).to have_content(snack3.name)
            expect(page).to have_content(snack3.price)
        end
        
        
    end
    
    
end

# As a visitor
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price