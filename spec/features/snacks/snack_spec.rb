require 'rails_helper'

RSpec.describe "Snacks-", type: :feature do
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
    it "can see the name, price, locations, avg price, and item count" do
        visit "/snacks/#{@snack_1.id}"

        expect(page).to have_content("Price: $3.50")
        within "#location_#{@machine_1.id}" do
          expect(page).to have_content("Union Station (3 kinds of snacks, average price of $2.50)")
        end
        within "#location_#{@machine_2.id}" do
          expect(page).to have_content("Larimer Square (1 kind of snacks, average price of $3.50)")
        end
    end
  end
end
