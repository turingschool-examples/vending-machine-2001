require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(current_path).to eq("/machines/#{dons.id}")
    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it 'user should see the name and price of all snacks associated with that machine' do
    dani = Owner.create(name: "Dani")
    machine1 = dani.machines.create(location: "Dani's Famous Vegan Thangs")

    edamame = machine1.snacks.create(name: "Delicious soy treat", price: 1.99)
    carrots = machine1.snacks.create(name: "Delicious carrot chip treat", price: 1.49)
    pretzels = machine1.snacks.create(name: "Delicious pretzel treat", price: 1.29)

    MachineSnack.create(machine_id: machine1.id, snack_id: edamame.id)
    MachineSnack.create(machine_id: machine1.id, snack_id: carrots.id)
    MachineSnack.create(machine_id: machine1.id, snack_id: pretzels.id)

    visit machine_path(dani)

    expect(current_path).to eq(machine_path(dani))
    expect(page).to have_content("#{machine1.location} Vending Machine")
    expect(page).to have_content(edamame.name)
    expect(page).to have_content(edamame.price)
    expect(page).to have_content(carrots.name)
    expect(page).to have_content(carrots.price)
    expect(page).to have_content(pretzels.name)
    expect(page).to have_content(pretzels.price)
  end
end
