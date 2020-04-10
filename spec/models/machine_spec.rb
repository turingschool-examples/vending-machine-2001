require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe "#average_snack_price" do
    it "can return average price of snacks that the machine has" do
      @sam = Owner.create!(name: "Sam's Snacks")
      @drinks = @sam.machines.create!(location: "Don's Mixed Drinks")
      @snack1 = Snack.create!(name: "Kool-Aid", price: 1)
      @snack2 = Snack.create!(name: "Fruit Punch", price: 1.5)
      @snack3 = Snack.create!(name: "Sweet Tea", price: 2)

      SnackMachine.create!(snack_id: @snack1.id, machine_id: @drinks.id)
      SnackMachine.create!(snack_id: @snack2.id, machine_id: @drinks.id)
      SnackMachine.create!(snack_id: @snack3.id, machine_id: @drinks.id)

      expect(@drinks.average_snack_price).to eq(1.5)
    end
  end
end
