require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe 'instance methods' do
    it ".average_price" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")

      snack_1 = Snack.create!(name: "Snickers", price: 1.75)
      snack_2 = Snack.create!(name: "Skittles", price: 1.5)
      snack_3 = Snack.create!(name: "Chips", price: 2)

      MachineSnack.create!(machine: dons, snack: snack_1)
      MachineSnack.create!(machine: dons, snack: snack_2)
      MachineSnack.create!(machine: dons, snack: snack_3)

      expect(dons.average_price).to eq(1.75)
    end
  end
end
