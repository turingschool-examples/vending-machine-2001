require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see the name and price of all the snacks associated with that machine and the average price of all snacks' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    snack_1 = Snack.create!(name: "Snickers", price: 1.75)
    snack_2 = Snack.create!(name: "Skittles", price: 1.5)
    snack_3 = Snack.create!(name: "Chips", price: 2)

    MachineSnack.create!(machine: dons, snack: snack_1)
    MachineSnack.create!(machine: dons, snack: snack_2)

    visit machine_path(dons)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content(snack_2.name)
    expect(page).to have_content(snack_2.price)


    expect(page).to_not have_content(snack_3.name)
    expect(page).to_not have_content(snack_3.price)

    expect(page).to have_content("Average Price: #{dons.average_price}")
  end
end
