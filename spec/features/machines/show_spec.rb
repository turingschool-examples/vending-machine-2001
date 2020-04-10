require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  before(:each) do

  @owner = Owner.create(name: "Sam's Snacks")
  @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
  @gummies  = @dons.snacks.create(name: "Haribo Gummies", price: 1)
  @crab_chips  = @dons.snacks.create(name: "Utz Crab Chips", price: 3)
  end

  scenario 'they see the location of that machine' do

    visit machine_path(@dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it "shows a list of snacks in the machine along with their price" do

    visit machine_path(@dons)

    expect(page).to have_content("#{@gummies.name}")
    expect(page).to have_content("#{@gummies.price}")

    expect(page).to have_content("#{@crab_chips.name}")
    expect(page).to have_content("#{@crab_chips.price}")
  end

  it "shows average price of snacks" do

    visit machine_path(@dons)

    expect(page).to have_content("2")
  end
end
