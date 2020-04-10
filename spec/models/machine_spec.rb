require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snacks }
    it { should have_many :snacks }
  end

  describe 'instance methods' do
    it 'machine#average_snack_price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack1 = Snack.create(name: "Hot Cheetos", price: 1.50)
      snack2 = Snack.create(name: "Takis", price: 1.25)
      snack3 = Snack.create(name: "Hot Fries", price: 1.75)

      dons.snacks << [snack1, snack2, snack3]

      expect(dons.average_snack_price).to eq(1.50)
    end
    it 'machine#num_of_snack_types' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack1 = Snack.create(name: "Hot Cheetos", price: 1.50)
      snack2 = Snack.create(name: "Takis", price: 1.25)
      snack3 = Snack.create(name: "Takis", price: 1.75)

      dons.snacks << [snack1, snack2, snack3]

      expect(dons.num_of_snack_types).to eq(3)
    end

  end

end
