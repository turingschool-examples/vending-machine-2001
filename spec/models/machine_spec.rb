require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe "relationships" do 
    it {should have_many :machine_snacks}
    it {should have_many(:snacks).through(:machine_snacks)}
  end

  describe "instance methods" do 
    it "#average_price" do 
      owner = Owner.create!(name: "Sam's Snacks")
      dons  = owner.machines.create!(location: "Don's Mixed Drinks")
      cranapple = Snack.create!(name: "Cranapple", price: 1.00)
      crangrape = Snack.create!(name: "Crangrape", price: 1.50)
      cranpineapple = Snack.create!(name: "Cranpineapple", price: 2.00)
      MachineSnack.create!(machine: dons, snack: cranapple)
      MachineSnack.create!(machine: dons, snack: crangrape)
      MachineSnack.create!(machine: dons, snack: cranpineapple)

      expect(dons.average_price).to eq(1.5)
    end
  end
end
