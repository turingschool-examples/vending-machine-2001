require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it "I see the name of all of the snacks associated with that vending machine along with their price" do 
    owner = Owner.create!(name: "Sam's Snacks")
    dons  = owner.machines.create!(location: "Don's Mixed Drinks")
    cranapple = Snack.create!(name: "Cranapple", price: 1.00)
    crangrape = Snack.create!(name: "Crangrape", price: 1.50)
    cranpineapple = Snack.create!(name: "Cranpineapple", price: 2.00)
    MachineSnack.create!(machine: dons, snack: cranapple)
    MachineSnack.create!(machine: dons, snack: crangrape)
    MachineSnack.create!(machine: dons, snack: cranpineapple)

    visit machine_path(dons)


    expect(page).to have_content("Cranapple")
    expect(page).to have_content("$1.00")
    expect(page).to have_content("Crangrape")
    expect(page).to have_content("$1.50")
    expect(page).to have_content("Cranpineapple")
    expect(page).to have_content("$2.00")
  end
end
