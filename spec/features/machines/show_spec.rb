require "rails_helper"

RSpec.describe "When I visit a machine show page" do
  it "I see snack names and price in a list" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    soda = dons.snacks.create(name: "soda", price: 3.50)
    chips = dons.snacks.create(name: "chips", price: 1.50)
    cheetos = dons.snacks.create(name: "cheetos", price: 2.50)

    visit machine_path(dons)

    within(".snack-list") do
      expect(page).to have_content("#{soda.name}: $#{soda.price}")
      expect(page).to have_content("#{chips.name}: $#{chips.price}")
      expect(page).to have_content("#{cheetos.name}: $#{cheetos.price}")
    end
  end

  it "I see a section that has the average price for all snacks" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    soda = dons.snacks.create(name: "soda", price: 3.50)
    chips = dons.snacks.create(name: "chips", price: 1.50)
    cheetos = dons.snacks.create(name: "cheetos", price: 2.50)

    visit machine_path(dons)

    within(".average-price") do
      expect(page).to have_content("Average Price: $#{dons.snacks.average_price.round(2)}")
    end
  end
end
