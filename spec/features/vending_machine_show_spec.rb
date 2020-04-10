require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    reeses = Snack.create(name: "Reeses", price: 1)
    lara_bar = Snack.create(name: "Lara Bar", price: 2)
    fig_newton = Snack.create(name: "Fig Newton", price: 2)
    MachineSnack.create(machine_id: dons.id, snack_id: reeses.id)
    MachineSnack.create(machine_id: dons.id, snack_id: lara_bar.id)

    visit "/machines/#{dons.id}"

    expect(page).to have_content(reeses.name)
    expect(page).to have_content(reeses.price)
    expect(page).to have_content(lara_bar.name)
    expect(page).to have_content(lara_bar.price)
    expect(page).to_not have_content(fig_newton.name)

    expect(page).to have_content("Average Price: $#{dons.average_snack_price}")
  end
end
