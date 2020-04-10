require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I see the names and prices of the snacks in the machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create(name: "Potato Chips", price: 2)
    snack2 = dons.snacks.create(name: "Chocolate Bar", price: 4)
    snack3 = dons.snacks.create(name: "Pop Tart", price: 7)

    visit "/machines/#{dons.id}"

    expect(page).to have_content(snack1.name)
    expect(page).to have_content("$#{snack1.price}.00")
    expect(page).to have_content(snack2.name)
    expect(page).to have_content("$#{snack2.price}.00")
    expect(page).to have_content(snack3.name)
    expect(page).to have_content("$#{snack3.price}.00")
  end

  it 'I can see the average price for all snacks' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: "Potato Chips", price: 2)
    dons.snacks.create(name: "Chocolate Bar", price: 4)
    dons.snacks.create(name: "Pop Tart", price: 7)

    visit "/machines/#{dons.id}"

    expect(page).to have_content("Average Price: $4.33")
  end
end