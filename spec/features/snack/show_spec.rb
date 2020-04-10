require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit /snacks/:id"
    before do
      @owner1 = Owner.create(name: "Sam's Snacks")
      @owner2 = Owner.create(name: "Bob B.")

      @dons  = @owner1.machines.create(location: "Don's Mixed Drinks")
      @bobs  = @owner2.machines.create(location: "Bob's Corner Store")

      @snack1 = Snack.create(name: "Hot Cheetos", price: 1.50)
      @snack2 = Snack.create(name: "Takis", price: 1.75)
      @snack3 = Snack.create(name: "Hot Fries", price: 1.25)

      @dons.snacks << @snack1
      @dons.snacks << @snack2

      @bobs.snacks << @snack1

      visit "/snacks/#{@snack1.id}"
    end
    it "I see the name and price for snacks" do

      within(".snack-header-info") do
        expect(page).to have_content(@snack1.name)
        expect(page).to have_content(@snack1.price)
      end

    end
    it "I also see a list of locations that carry that snack and their avg price" do

      within("##{@dons.id}") do
        expect(page).to have_content(@dons.location)
        expect(page).to have_content("average price of $#{@dons.average_snack_price}")
      end

      within("##{@bobs.id}") do
        expect(page).to have_content(@bobs.location)
        expect(page).to have_content("average price of $#{@bobs.average_snack_price}")
      end

    end
    it "I also see a count of the different kinds of items in that vending machine" do
      @dons.snacks << @snack3

      visit "/snacks/#{@snack1.id}"

      within("##{@dons.id}") do
        expect(page).to have_content("3 kinds of snacks")
      end

      within("##{@bobs.id}") do
        expect(page).to have_content("1 kind of snack")
      end

    end
end

