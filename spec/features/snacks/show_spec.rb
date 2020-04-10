require "rails_helper"

RSpec.describe "When I visit a snacks show page" do
  it "I see name of snack" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    soda = dons.snacks.create(name: "soda", price: 3.50)

    visit "/snacks/#{soda.id}"

    expect(page).to have_content(soda.name)
  end

  it "I see a list of locations that carry snack" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    steves  = owner.machines.create(location: "Steves Pun Shop")
    soda = Snack.create(name: "soda", price: 3.50)
    MachineSnack.create(machine: steves, snack: soda)
    MachineSnack.create(machine: dons, snack: soda)

    visit snack_path(soda)

    within(".machine-list") do
      expect(page).to have_content("#{dons.location}")
      expect(page).to have_content("#{steves.location}")
    end
  end
end
