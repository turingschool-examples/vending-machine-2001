require "rails_helper"

RSpec.describe "When I visit a snacks show page" do
  it "I see name of snack" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    soda = dons.snacks.create(name: "soda", price: 3.50)

    visit "/snacks/#{soda.id}"

    expect(page).to have_content(soda.name)
  end
end
