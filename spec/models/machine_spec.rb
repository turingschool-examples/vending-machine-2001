require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'relationships' do
    it {should have_many :machine_snacks}
    it {should have_many(:snacks).through(:machine_snacks)}
  end

  describe 'instance methods' do
    it ".snack_avg_price" do
      sam = Owner.create(name: "Sam's Snacks")
    
      machine1 = sam.machines.create(location: "Don's Mixed Drinks")
      
      snack1 = Snack.create!(name: "M&Ms", price: 1.00)
      snack2 = Snack.create!(name: "Jerkey", price: 3.00)

      MachineSnack.create!(machine_id: machine1.id, snack_id: snack1.id)
      MachineSnack.create!(machine_id: machine1.id, snack_id: snack2.id)

      expect(machine1.snack_avg_price).to eq(2.0)
    end
  end
end
