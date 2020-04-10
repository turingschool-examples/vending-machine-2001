require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  scenario 'they can see the name and price of all snacks in that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    funyons  = dons.snacks.create(name: "Funyons", price: "1.20")
    canyon  = dons.snacks.create(name: "Boulder Canyon Sea Salt Chips", price: "2.00")
    twix  = dons.snacks.create(name: "Twix", price: "1.50")

    visit machine_path(dons)

    within "#snack-#{funyons.id}" do
      expect(page).to have_content(funyons.name)
      expect(page).to have_content("$#{funyons.price}")
    end

    within "#snack-#{canyon.id}" do
      expect(page).to have_content(canyon.name)
      expect(page).to have_content("$#{canyon.price}")
    end

    within "#snack-#{twix.id}" do
      expect(page).to have_content(twix.name)
      expect(page).to have_content("$#{twix.price}")
    end
  end
  scenario 'they can see the the average price of all snacks in that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    funyons  = dons.snacks.create(name: "Funyons", price: "1.20")
    canyon  = dons.snacks.create(name: "Boulder Canyon Sea Salt Chips", price: "2.00")
    twix  = dons.snacks.create(name: "Twix", price: "1.50")

    sum = dons.snacks.sum { |snack| snack.price }
    average = (sum/dons.snacks.size).round(2)

    visit machine_path(dons)

    expect(page).to have_content("Average Price: $#{average}")
  end
end
