require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I see the name, price, and average price of the snack' do
    describe 'I see a list of locations of the vending machines that carry that snack' do
      it 'I see a count of the different kinds of items in the vending machine' do
        owner = Owner.create(name: "Sam's Snacks")
        dons  = owner.machines.create(location: "Don's Mixed Drinks")
        turing = owner.machines.create(location: "Turing Basement")
        snack1 = Snack.create(name: "Potato Chips", price: 2)
        snack2 = Snack.create(name: "Chocolate Bar", price: 4)
        snack3 = Snack.create(name: "Pop Tart", price: 7)
        snack4 = Snack.create(name: "Health Bar", price: 12)
        snack5 = Snack.create(name: "Peanuts", price: 1)

        dons.snacks << [snack1, snack2, snack3]
        turing.snacks << [snack3, snack4, snack5]

        visit "/snacks/#{snack3.id}"

        expect(page).to have_content(snack3.name)
        expect(page).to have_content("Price: $#{snack3.price}.00")
        expect(page).to have_content(dons.location)
        expect(page).to have_content("average price of $4.33")
        expect(page).to have_content("3 kinds of snacks")
        expect(page).to have_content(turing.location)
        expect(page).to have_content("average price of $6.67")
        expect(page).to have_content("3 kinds of snacks")
      end
    end
  end
end
