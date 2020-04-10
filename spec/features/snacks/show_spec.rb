require 'rails_helper'

RSpec.describe 'As a visitor on the snack show page' do
  it "I see the name of the snack, location of machines that carry it, avg price of snack, count of different items" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    twix = Snack.create(name: 'Twix', price: 2, owner_id: owner.id)
    reeses = Snack.create(name: 'Reeses', price: 3, owner_id: owner.id)
    dons.machine_snacks.create(machine_id: dons.id, snack_id: twix.id, price:twix.price, quantity:3)
    dons.machine_snacks.create(machine_id: dons.id, snack_id: reeses.id, price:reeses.price, quantity:5)

    visit snack_path(twix)

    expect(page).to have_content(twix.name)
    expect(page).to have_content(dons.location)
    expect(page).to have_content(dons.average_price)
    expect(page).to have_content(dons.item_count)

  end
end
# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
