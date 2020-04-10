require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see the name of all the snacks assoc with that machine and their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    twix = dons.snacks.create(name: 'Twix', price: 2)
    reeses = dons.snacks.create(name: 'Reeses', price: 2)

    visit machine_path(dons)

    within '.snacks-index' do
      expect(page).to have_content(twix.name)
      expect(page).to have_content(twix.price)
      expect(page).to have_content(reeses.name)
      expect(page).to have_content(reeses.price)
    end
  end
end
