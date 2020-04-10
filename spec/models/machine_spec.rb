require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe "relationships" do
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe "methods" do
      it "average_price" do

        bob = Owner.create(name: "Bob")
        vending1 = bob.machines.create(location: "Bowling Alley")
        snack1 = Snack.create(name: "Doritos", price: 2)
        snack2 = Snack.create(name: "Snickers", price: 4)
        snack3 = Snack.create(name: "Cookies", price: 6)
        MachineSnack.create(machine: vending1, snack: snack1, amount: 1)
        MachineSnack.create(machine: vending1, snack: snack2, amount: 2)
        MachineSnack.create(machine: vending1, snack: snack3, amount: 3)

        expect(vending1.average_price).to eq(4) 
      end
  end
  
  
  
end
