require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  before(:each) do

  @owner = Owner.create(name: "Sam's Snacks")
  @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
  @gummies  = @dons.snacks.create(name: "Gummies", price: 2)
  end

  scenario 'they see the location of that machine' do

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it "shows a list of snacks in the machine along with their price" do

    visit machine_path(dons)

    expect(page).to have_content("#{@gummies.name}")
    expect(page).to have_content("#{@gummies.price}")
  end

end


# As a visitor
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price
