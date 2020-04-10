require 'rails_helper'

RSpec.describe Machine, type: :model do
  before(:each) do
    @sam = Owner.create!(name: "Sam's Snacks")
    @machine1 = @sam.machines.create!(location: "Don's Mixed Drinks")
    @machine2 = @sam.machines.create!(location: "Turing School")
    @machine3 = @sam.machines.create!(location: "Walmart")
    @snack1 = Snack.create!(name: "Kool-Aid", price: 1)
    @snack2 = Snack.create!(name: "Fruit Punch", price: 1.5)
    @snack3 = Snack.create!(name: "Sweet Tea", price: 2)

    SnackMachine.create!(snack_id: @snack1.id, machine_id: @machine1.id)
    SnackMachine.create!(snack_id: @snack2.id, machine_id: @machine1.id)
    SnackMachine.create!(snack_id: @snack3.id, machine_id: @machine1.id)
    SnackMachine.create!(snack_id: @snack1.id, machine_id: @machine2.id)
    SnackMachine.create!(snack_id: @snack2.id, machine_id: @machine2.id)
    SnackMachine.create!(snack_id: @snack1.id, machine_id: @machine3.id)
  end
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe "#average_snack_price" do
    it "can return average price of snacks that the machine has" do
      expect(@machine1.average_snack_price).to eq(1.5)
    end
  end

  describe "#snack_count" do
    it "can return the total snacks in the machine" do
      expect(@machine1.snack_count).to eq(3)
      expect(@machine2.snack_count).to eq(2)
      expect(@machine3.snack_count).to eq(1)
    end
  end
end
