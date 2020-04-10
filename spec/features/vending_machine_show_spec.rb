require 'rails_helper'

RSpec.describe "when I visit a machines show page", type: :feature do
  it "I see all the machines snacks and prices" do

    sam = Owner.create(name: "Sam's Snacks")
    machine = sam.machines.create(location: "Don's Mixed Drinks")


  end
end

​
# As a visitor
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price
