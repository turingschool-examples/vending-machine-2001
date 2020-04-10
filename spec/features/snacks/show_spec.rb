require 'rails_helper'

RSpec.describe "When I visit a snack show page", type: :feature do
  before(:each) do
    sam = Owner.create(name: "Sam's Snacks")
    
    @machine1 = sam.machines.create(location: "Don's Mixed Drinks")
    @machine2 = sam.machines.create(location: "Turing Basement")
    @snack1 = Snack.create!(name: "M&Ms", price: 1.00)
    @snack2 = Snack.create!(name: "Jerkey", price: 3.00)

    MachineSnack.create!(machine_id: @machine1.id, snack_id: @snack1.id)
    MachineSnack.create!(machine_id: @machine2.id, snack_id: @snack1.id)

    visit "/snacks/#{@snack1.id}"
  end
  
  
  it "I see name and price of that snack " do
    within "#snack" do
      expect(page).to have_content(@snack1.name)
      expect(page).to have_content(@snack1.price)
    end
  end
  
  it "I see list of locations with vending machines that carry that snack" do
    within "#machine-#{@machine1.id}" do
      expect(page).to have_content(@machine1.location)
    end
    
    within "#machine-#{@machine2.id}" do
      expect(page).to have_content(@machine2.location)
    end
  end
  
  it "I see avg price of snacks in aech of those machines that carry that snack" do

  end
  
  it "I see a count of snack types in each of those machines that carry that snack" do

  end
end



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