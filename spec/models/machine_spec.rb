require 'rails_helper'

RSpec.describe Machine, type: :model do
  before (:each) do
    @sam = Owner.create(name: "Sam's Snacks")
    @machine_1 = Machine.create(owner_id: @sam.id, location: "Union Station")
    @machine_2 = Machine.create(owner_id: @sam.id, location: "Larimer Square")

    @snack_1 = Snack.create(name: "White Castle Burger", price: 3.5)
    @snack_2 = Snack.create(name: "Pop Rocks", price: 1.5)
    @snack_3 = Snack.create(name: "Flaming Hot Cheetos", price: 2.5)

    MachineSnack.create(machine_id: @machine_1.id, snack_id: @snack_1.id)
    MachineSnack.create(machine_id: @machine_1.id, snack_id: @snack_2.id)
    MachineSnack.create(machine_id: @machine_1.id, snack_id: @snack_3.id)
    MachineSnack.create(machine_id: @machine_2.id, snack_id: @snack_1.id)
  end

  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it {should have_many :machine_snacks }
    it {should have_many :snacks }
  end

  describe 'methods' do
    it "#average_price" do
      expect(@machine_1.average_snack_price).to eq(2.5)
      expect(@machine_2.average_snack_price).to eq(3.5)
    end

    it "#display_average_snack_price" do
      expect(@machine_1.display_average_snack_price).to eq("$2.50")
      expect(@machine_2.display_average_snack_price).to eq("$3.50")
    end

    it "#snack_count" do
      expect(@machine_1.snack_count).to eq(3)
      expect(@machine_2.snack_count).to eq(1)
    end
  end
end
