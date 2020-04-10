require 'rails_helper'

RSpec.describe 'Vending machines show page' do
    before(:each) do
        @owner = Owner.create!(name: "John Preston")
        @machine1 = @owner.machines.create!(location: "Don's Mixed Drinks")
        @doritos = Snack.create!(name: "Doritos", price: 2.0)
        @cheetos = Snack.create!(name: 'Cheetos', price: 3.0)
        @donuts = Snack.create!(name: 'DoNuts', price: 4.0)
        @snickers = Snack.create!(name: "Snickers", price: 3.0)

        MachineSnack.create!(machine: @machine1, snack: @doritos)
        MachineSnack.create!(machine: @machine1, snack: @cheetos)
        MachineSnack.create!(machine: @machine1, snack: @donuts)
        MachineSnack.create!(machine: @machine1, snack: @snickers)
    end

    it "can show all machine snacks" do
       visit "/machines/#{@machine1.id}"
       expect(page).to have_content("Don's Mixed Drinks") 
        within "#machine-snack-#{@doritos.id}" do
            expect(page).to have_content('Doritos')
            expect(page).to have_content('$ 2.00')
        end
        within "#machine-snack-#{@cheetos.id}" do
            expect(page).to have_content('Cheetos')
            expect(page).to have_content('$ 3.00')
        end

        within "#machine-snack-#{@donuts.id}" do
            expect(page).to have_content('DoNuts')
            expect(page).to have_content('$ 4.00')
        end

        within "#machine-snack-#{@snickers.id}" do
            expect(page).to have_content('Snickers')
            expect(page).to have_content('$ 3.00')
        end
    end

    it "shows an average price for all snacks at that machine" do
        visit "/machines/#{@machine1.id}"
        within "#average-price" do
            expect(page).to have_content('Average Price Per Snack')
            expect(page).to have_content('$ 3.00')
        end
    end
end



# User Story 2 of 3
# ​
# As a visitor
# When I visit a vending machine show page
# I also see an average price for all of the snacks in that machine
# ```
# ​
# ### Example
# ```Don's Mixed Drinks
# Snacks
# * White Castle Burger: $3.50
# * Pop Rocks: $1.50
# * Flaming Hot Cheetos: $2.50
# Average Price: $2.50
# ```
# ​
# ## Visiting a Snack Page
# ​
# ### Story
# ​
# ```
# User Story 3 of 3
# ​
# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
# ```
# ​
# ### Example
# ​
# ```
# Flaming Hot Cheetos
# Price: $2.50
# Locations
# * Don's Mixed Drinks (3 kinds of snacks, average price of $2.50)
# * Turing Basement (2 kinds of snacks, average price of $3.00)
# ```
# ​