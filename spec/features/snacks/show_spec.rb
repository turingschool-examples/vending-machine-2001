require 'rails_helper'

RSpec.describe "As a visitor when I visit a snack show page" do
  it "I see the name and price for that snack" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    snack_1 = Snack.create!(name: "Snickers", price: 1.75)
    snack_2 = Snack.create!(name: "Skittles", price: 1.5)
    snack_3 = Snack.create!(name: "Chips", price: 2)

    MachineSnack.create!(machine: dons, snack: snack_1)
    MachineSnack.create!(machine: dons, snack: snack_2)

    visit "/snacks/#{snack_1.id}"
    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to_not have_content(snack_2.name)
    expect(page).to_not have_content(snack_2.price)
  end

  it "I see a list of locations that have that snack" do
    owner = Owner.create(name: "Sam's Snacks")
    machine_1  = owner.machines.create(location: "Don's Mixed Drinks")
    machine_2  = owner.machines.create(location: "Steve's House")

    snack_1 = Snack.create!(name: "Snickers", price: 1.75)


    MachineSnack.create!(machine: machine_1, snack: snack_1)
    MachineSnack.create!(machine: machine_2, snack: snack_1)

    visit "/snacks/#{snack_1.id}"
    expect(page).to have_content(machine_1.location)
    expect(page).to have_content(machine_2.location)
  end

  it "I see the average price of snacks at each location" do
    owner = Owner.create(name: "Sam's Snacks")
    machine_1  = owner.machines.create(location: "Don's Mixed Drinks")
    machine_2  = owner.machines.create(location: "Steve's House")

    snack_1 = Snack.create!(name: "Snickers", price: 1.75)



    MachineSnack.create!(machine: machine_1, snack: snack_1)
    MachineSnack.create!(machine: machine_2, snack: snack_1)
    MachineSnack.create!(machine: machine_2, snack: snack_1)

    visit "/snacks/#{snack_1.id}"
    expect(page).to have_content(machine_1.average_price)
    expect(page).to have_content(machine_2.average_price)
  end
end
