require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit /machines/:id"
    before do
      @owner = Owner.create(name: "Sam's Snacks")
      @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
      @snack1 = Snack.create(name: "Hot Cheetos", price: 1.50)
      @snack2 = Snack.create(name: "Takis", price: 1.75)

      @dons.snacks << @snack1
      @dons.snacks << @snack2
    end
    it "I can see the name and prices of all snacks associated with that vending machine" do
      visit "/machines/#{@dons.id}"

      expect(page).to have_content(@snack1.name)
      expect(page).to have_content(@snack1.price)
      expect(page).to have_content(@snack2.name)
      expect(page).to have_content(@snack2.name)

    end
    it "I also see an average price for all of the snacks in that machine" do
      visit "/machines/#{@dons.id}"

      expect(page).to have_content("Average Price: $1.63")
    end
end

