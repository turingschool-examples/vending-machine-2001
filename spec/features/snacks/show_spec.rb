require 'rails_helper'

RSpec.describe "When a user visits the snack show", type: :feature do

  it "can see the price, list of locations with vending machines that carry that
      snack, the average price for snacks in those vending machines, and the count
      of the different items in that vending machine" do

    @sam = Owner.create!(name: "Sam's Snacks")
    @machine1 = @sam.machines.create!(location: "Don's Mixed Drinks")
    @machine2 = @sam.machines.create!(location: "Turing School")
    @machine3 = @sam.machines.create!(location: "Walmart")
    @snack1 = Snack.create!(name: "Kool-Aid", price: 1.00)
    @snack2 = Snack.create!(name: "Fruit Punch", price: 1.50)
    @snack3 = Snack.create!(name: "Sweet Tea", price: 2.00)

    SnackMachine.create!(snack_id: @snack1.id, machine_id: @machine1.id)
    SnackMachine.create!(snack_id: @snack2.id, machine_id: @machine1.id)
    SnackMachine.create!(snack_id: @snack3.id, machine_id: @machine1.id)
    SnackMachine.create!(snack_id: @snack1.id, machine_id: @machine2.id)
    SnackMachine.create!(snack_id: @snack2.id, machine_id: @machine2.id)
    SnackMachine.create!(snack_id: @snack1.id, machine_id: @machine3.id)

    visit "/snacks/#{@snack1.id}"

    expect(page).to have_content(@snack1.price)

    within("#machine-#{@machine1.id}") do
      expect(page).to have_content(@machine1.location)
      expect(page).to have_content(@machine1.average_snack_price)
      expect(page).to have_content(@machine1.snack_count)
    end

    within("#machine-#{@machine2.id}") do
      expect(page).to have_content(@machine2.location)
      expect(page).to have_content(@machine2.average_snack_price)
      expect(page).to have_content(@machine2.snack_count)
    end

    within("#machine-#{@machine3.id}") do
      expect(page).to have_content(@machine3.location)
      expect(page).to have_content(@machine3.average_snack_price)
      expect(page).to have_content(@machine3.snack_count)
    end
  end
end
