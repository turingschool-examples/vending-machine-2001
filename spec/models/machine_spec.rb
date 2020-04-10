require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snack }
  end

  describe "instance methods" do
    it "can average the price of its snacks" do

      sam = Owner.create(name: "Sam's Snacks")
      machine = sam.machines.create(location: "Don's Mixed Drinks")

      snack1 = Snack.create(name: "White Castle Burger", price: 5)
      snack2 = Snack.create(name: "Pop Rocks", price: 5)
      snack3 = Snack.create(name: "Flaming Hot Cheetos", price: 2)

      MachineSnack.create(machine_id: machine.id, snack_id: snack1.id)
      MachineSnack.create(machine_id: machine.id, snack_id: snack2.id)
      MachineSnack.create(machine_id: machine.id, snack_id: snack3.id)

      expect(machine.average_snack_price).to eq(4)
    end
  end
end
