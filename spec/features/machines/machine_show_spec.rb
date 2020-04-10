require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario "they see the name and price of all snacks associated with that machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    burger = dons.snacks.create(name: "White Castle Burger", price: 3.5)
    pop_rocks = dons.snacks.create(name: "Pop Rocks", price: 1.5)
    cheetos = dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.5)

    visit machine_path(dons)

    expect(page).to have_content("#{burger.name}: $#{burger.price}")
    expect(page).to have_content("#{pop_rocks.name}: $#{pop_rocks.price}")
    expect(page).to have_content("#{cheetos.name}: $#{cheetos.price}")
    expect(page).to have_content("Average Price: $#{dons.avg_price}")
  end
end
