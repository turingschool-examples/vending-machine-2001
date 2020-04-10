require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  describe 'they see' do
    it "the name of all the snacks assoc with that machine and their price" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      twix = Snack.create(name: 'Twix', price: 2, owner_id: owner.id)
      reeses = Snack.create(name: 'Reeses', price: 3, owner_id: owner.id)
      dons.machine_snacks.create(machine_id: dons.id, snack_id: twix.id, price:twix.price, quantity:3)
      dons.machine_snacks.create(machine_id: dons.id, snack_id: reeses.id, price:reeses.price, quantity:5)

      visit machine_path(dons)
      save_and_open_page

      within '.snacks-index' do
        expect(page).to have_content(twix.name)
        expect(page).to have_content(twix.price)
        expect(page).to have_content(reeses.name)
        expect(page).to have_content(reeses.price)
      end
    end

    it "the average price for all snacks in the machine" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      twix = Snack.create(name: 'Twix', price: 2, owner_id: owner.id)
      reeses = Snack.create(name: 'Reeses', price: 3, owner_id: owner.id)
      dons.machine_snacks.create(machine_id: dons.id, snack_id: twix.id, price:twix.price, quantity:3)
      dons.machine_snacks.create(machine_id: dons.id, snack_id: reeses.id, price:reeses.price, quantity:5)
    end
  end
end
