require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end
  describe "relationships" do
    it { should have_many :machine_snacks}
    it {should have_many(:snacks).through(:machine_snacks)}
  end

  describe "methods" do
    it 'average' do
      sam = Owner.create(name: "Sam's Snacks")
      dons = sam.machines.create(location: "Don's Mixed Drinks")
      dons.snacks.create(name: 'cheese sticks', price: 1.50)
      dons.snacks.create(name: 'Chips n Dip', price: 3.00)
      dons.snacks.create(name: "Hot Pockets", price: 4.50)

      expect(dons.average).to eq(3)
    end
  end
end
