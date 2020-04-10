require 'rails_helper'

RSpec.describe "When I visit a machine show page", type: :feature do
  it "I see name and price of each snack associated with this machine" do
    sam = Owner.create(name: "Sam's Snacks")
    
    machine1 = sam.machines.create(location: "Don's Mixed Drinks")
    
    snack1 = Snack.create!(name: "M&Ms", price: 1.00)
    snack2 = Snack.create!(name: "Jerkey", price: 3.00)

    MachineSnack.create!(machine_id: machine1.id, snack_id: snack1.id)
    MachineSnack.create!(machine_id: machine1.id, snack_id: snack2.id)

    visit "/machines/#{machine1.id}"

    expect(page).to have_content("#{snack1.name} Price: #{snack1.price}")
    expect(page).to have_content("#{snack2.name} Price: #{snack2.price}")
  end

end




# User Story 1 of 3
# ​
# As a visitor
# When I visit a vending machine show page
# I see the name of all of the snacks associated 
# with that vending machine along with their price