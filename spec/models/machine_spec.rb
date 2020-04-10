require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :snacks }
  end

  describe 'instance methods' do
    it 'should return average snack price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      dons.snacks.create(name: "Potato Chips", price: 2)
      dons.snacks.create(name: "Chocolate Bar", price: 4)
      dons.snacks.create(name: "Pop Tart", price: 7)

      expect(dons.average_snack_price).to eq(4.33)
    end
    it 'should return snack count per machine' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      dons.snacks.create(name: "Potato Chips", price: 2)
      dons.snacks.create(name: "Chocolate Bar", price: 4)
      dons.snacks.create(name: "Pop Tart", price: 7)

      expect(dons.snack_count).to eq(3)
    end
  end
end
