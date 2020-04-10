require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'relationships' do
    it { should have_many(:machine_snacks) }
    it { should have_many(:snacks).through(:machine_snacks) } 
  end

  describe 'instance methods' do
    before(:each) do
      @owner = Owner.create!(name: "John Preston")
      @machine1 = @owner.machines.create!(location: "Don's Mixed Drinks")
      @doritos = Snack.create!(name: "Doritos", price: 2.0)
      @cheetos = Snack.create!(name: 'Cheetos', price: 3.0)
      @donuts = Snack.create!(name: 'DoNuts', price: 4.0)
      @snickers = Snack.create!(name: "Snickers", price: 3.0)

      MachineSnack.create!(machine: @machine1, snack: @doritos)
      MachineSnack.create!(machine: @machine1, snack: @cheetos)
      MachineSnack.create!(machine: @machine1, snack: @donuts)
      MachineSnack.create!(machine: @machine1, snack: @snickers)
    end

    it "average_snack_price" do
      expect(@machine1.average_snack_price).to eq(3.0)  
    end

    it "count_of_snacks" do
      expect(@machine1.count_of_snacks).to eq(4)
    end
  end
end
