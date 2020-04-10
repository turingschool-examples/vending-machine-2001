require 'rails_helper'

RSpec.describe 'When a user visits a snack machine show page', type: :feature do
  scenario 'they see the price, locations with that snack, average price of machines and item type count' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    funyons  = dons.snacks.create(name: "Funyons", price: "1.20")
    canyon  = dons.snacks.create(name: "Boulder Canyon Sea Salt Chips", price: "2.00")
    twix  = dons.snacks.create(name: "Twix", price: "1.50")

    visit "/snacks/#{funyons.name}"

    expect(page).to have_content(funyons.name)

  end
end
# 
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
