require 'rails_helper'

RSpec.describe "when I visit a snack show page" do
  it "I see the name of the snack and the price of the snack" do

    sam = Owner.create(name: "Sam's Snacks")
    machine1 = sam.machines.create(location: "Don's Mixed Drinks")
    machine2 = sam.machines.create(location: "Turing Basement")

    snack1 = Snack.create(name: "White Castle Burger", price: 3.5)
    snack2 = Snack.create(name: "Pop Rocks", price: 1.5)
    snack3 = Snack.create(name: "Flaming Hot Cheetos", price: 2.5)

    MachineSnack.create(machine_id: machine1.id, snack_id: snack1.id)
    MachineSnack.create(machine_id: machine1.id, snack_id: snack1.id)
    MachineSnack.create(machine_id: machine1.id, snack_id: snack2.id)
    MachineSnack.create(machine_id: machine2.id, snack_id: snack2.id)

    visit snack_path(snack1)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack1.price)
  end

  it "I can also see a list of the locations with vending machines that have this snack" do
    sam = Owner.create(name: "Sam's Snacks")
    machine1 = sam.machines.create(location: "Don's Mixed Drinks")
    machine2 = sam.machines.create(location: "Turing Basement")

    snack1 = Snack.create(name: "White Castle Burger", price: 3.5)
    snack2 = Snack.create(name: "Pop Rocks", price: 1.5)
    snack3 = Snack.create(name: "Flaming Hot Cheetos", price: 2.5)

    MachineSnack.create(machine_id: machine1.id, snack_id: snack1.id)
    MachineSnack.create(machine_id: machine1.id, snack_id: snack1.id)
    MachineSnack.create(machine_id: machine1.id, snack_id: snack2.id)
    MachineSnack.create(machine_id: machine2.id, snack_id: snack2.id)

    visit snack_path(snack2)

    expect(page).to have_content("Locations:")
    expect(page).to have_content(machine1.location)
    expect(page).to have_content(machine2.location)
  end
end
