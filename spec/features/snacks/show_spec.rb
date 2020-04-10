require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do
  before(:each) do

  @owner = Owner.create(name: "Sam's Snacks")
  @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
  @gummies  = @dons.snacks.create(name: "Haribo Gummies", price: 1)
  @crab_chips  = @dons.snacks.create(name: "Utz Crab Chips", price: 3)
  end

  scenario 'see the name, price, locations of snack, and average price, and count of items in that vending machine' do

    visit "/snacks/#{@crab_chips.id}"

    save_and_open_page

    expect(page).to have_content("#{@crab_chips.price}")
    expect(page).to have_content("Locations: #{@dons.location}")
    expect(page).to have_content("Average Snack Price: 2")
    expect(page).to have_content("Number of Snacks: 2")
  end
end

# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
