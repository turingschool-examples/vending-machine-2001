require 'rails_helper'

RSpec.describe "when I visit a machines show page", type: :feature do
  it "I see all the machines snacks and prices" do

    sam = Owner.create(name: "Sam's Snacks")
    machine = sam.machines.create(location: "Don's Mixed Drinks")

    snack1 = Snack.create(name: "White Castle Burger", price: 3.5)
    snack2 = Snack.create(name: "Pop Rocks", price: 1.5)
    snack3 = Snack.create(name: "Flaming Hot Cheetos", price: 2.5)

    MachineSnack.create(machine_id: machine.id, snack_id: snack1.id)
    MachineSnack.create(machine_id: machine.id, snack_id: snack2.id)
    MachineSnack.create(machine_id: machine.id, snack_id: snack3.id)

    visit machine_path(machine)

    expect(page).to have_content("White Castle Burger: $3.50")
    expect(page).to have_content("Pop Rocks: $1.50")
    expect(page).to have_content("Flaming Hot Cheetos: $2.50")

  end

  it "I also see the average price of snacks in the machine" do

    sam = Owner.create(name: "Sam's Snacks")
    machine = sam.machines.create(location: "Don's Mixed Drinks")

    snack1 = Snack.create(name: "White Castle Burger", price: 3.5)
    snack2 = Snack.create(name: "Pop Rocks", price: 1.5)
    snack3 = Snack.create(name: "Flaming Hot Cheetos", price: 2.5)

    MachineSnack.create(machine_id: machine.id, snack_id: snack1.id)
    MachineSnack.create(machine_id: machine.id, snack_id: snack2.id)
    MachineSnack.create(machine_id: machine.id, snack_id: snack3.id)

    visit machine_path(machine)

    expect(page).to have_content("Average Price: $2.00")
  end
end
