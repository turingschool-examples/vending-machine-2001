require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do
  scenario 'they see the details of that snack' do
    white_castle = Snack.create(name: "White Castle Burger", price: 3.5)
    pop_rocks = Snack.create(name: "Pop Rocks", price: 1.5)
    hot_cheetos = Snack.create(name: "Flaming Hot Cheetos", price: 2.5)
    owner = Owner.create(name: "Sam's Snacks")
    dons = owner.machines.create(location: "Don's Mixed Drinks", snacks:[white_castle, pop_rocks, hot_cheetos])
    basement = owner.machines.create(location: "Turing Basement", snacks:[white_castle, hot_cheetos])


    visit snack_path(hot_cheetos)
    save_and_open_page

    expect(page).to have_content(hot_cheetos.name)
    within('#snack-info') do
      expect(page).to have_content("Price: $2.50")
    end

    within('#locations') do
      expect(page).to have_content("Don's Mixed Drinks (3 kinds of snacks, average price of $2.50")
      expect(page).to have_content("Turing Basement (2 kinds of snacks, average price of $3.00")
    end
  end
end
