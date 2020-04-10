require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'see the name of all of the snacks associated with that vending machine along with their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    penut_mms = Snack.create(name: "Penut MMs", price: "100.85")
    tacos = Snack.create(name: "Street Taco", price: "8.40")
    dons.snacks << penut_mms
    dons.snacks << tacos

    visit machine_path(dons)

    within 'section.snack-list' do
      expect(page).to have_content(penut_mms.name)
      expect(page).to have_content(penut_mms.price)
      expect(page).to have_content(tacos.name)
      expect(page).to have_content(tacos.price) 
    end
  end

  scenario 'see average price of all snacks in the machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    penut_mms = Snack.create(name: "Penut MMs", price: "100.85")
    tacos = Snack.create(name: "Street Taco", price: "8.40")
    dons.snacks << penut_mms
    dons.snacks << tacos

    visit machine_path(dons)

    within 'section.snack-stats' do
      expect(page).to have_content("Average snack price: $54.63")
    end
  end
end
