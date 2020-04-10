require 'rails_helper'

RSpec.describe "Machines", type: :feature do
  before (:each) do
    @sam = Owner.create(name: "Sam's Snacks")
    @machine_1 = Machine.create(owner_id: @sam.id, location: "Union Station")
    @machine_2 = Machine.create(owner_id: @sam.id, location: "Larimer Square")

    @snack_1 = Snack.create(name: "White Castle Burger", price: 3.5)
    @snack_2 = Snack.create(name: "Pop Rocks", price: 1.5)
    @snack_3 = Snack.create(name: "Flaming Hot Cheetos", price: 2.5)

    MachineSnack.create(machine_id: @machine_1.id, snack_id: @snack_1.id)
    MachineSnack.create(machine_id: @machine_1.id, snack_id: @snack_2.id)
    MachineSnack.create(machine_id: @machine_1.id, snack_id: @snack_3.id)
    MachineSnack.create(machine_id: @machine_2.id, snack_id: @snack_1.id)
  end
  describe "As a User when I visit the show page I " do
    it "can see the name/price of all snacks associated with that vending machine" do
      visit "machines/#{@machine_1.id}"
      within "##{@snack_1.id}" do
        expect(page).to have_content(@snack_1.name)
        expect(page).to have_content(@snack_1.price)
      end

      within "##{@snack_2.id}" do
        expect(page).to have_content(@snack_2.name)
        expect(page).to have_content(@snack_2.price)
      end

      within "##{@snack_3.id}" do
        expect(page).to have_content(@snack_3.name)
        expect(page).to have_content(@snack_3.price)
      end
    end

    it "can see the average price of all snacks in that machine" do
      visit "machines/#{@machine_1.id}"

      expect(page).to have_content("Average Snack Price: 2.5")
    end
  end
end
