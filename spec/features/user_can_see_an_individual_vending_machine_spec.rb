require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see the name of all the snacks with that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    white_castle = dons.snacks.create(name: "White Castle Burger", price: 3.5)
    pop_rocks = dons.snacks.create(name: "Pop Rocks", price: 1.5)
    hot_cheetos = dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.5)

    visit machine_path(dons)

    expect(page).to have_content(white_castle.name)
    expect(page).to have_content(pop_rocks.name)
    expect(page).to have_content(hot_cheetos.name)
  end
end
