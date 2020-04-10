require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  xscenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see the name of all snacks and their prices' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack = Snack.create(name: "Reeses", price: 1)
    snack2 = Snack.create(name: "Starburst", price: 2)
    snack3 = Snack.create(name: "Hot Cheetos", price: 3)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.price)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack2.price)
    expect(page).to have_content(snack3.name)
    expect(page).to have_content(snack3.price)
  end
end
