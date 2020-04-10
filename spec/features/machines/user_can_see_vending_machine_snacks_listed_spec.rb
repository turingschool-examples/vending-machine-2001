require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see all the snacks associated with that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: "peanuts", price: 1.00)
    snack_2 = dons.snacks.create(name: "granola bar", price: 1.50)
    snack_3 = dons.snacks.create(name: "candy", price: 1.25)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")

    within(".machine-snacks-main-block") do
      expect(page).to have_content(snack_1.name)
      expect(page).to have_content(snack_1.price)

      expect(page).to have_content(snack_2.name)
      expect(page).to have_content(snack_2.price)

      expect(page).to have_content(snack_3.name)
      expect(page).to have_content(snack_3.price)
    end
  end
end
