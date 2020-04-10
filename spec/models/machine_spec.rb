require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it {should have_many(:snacks).through(:machine_snacks)}

  end

  describe "instance methods" do
    before(:each) do
      owner = Owner.create(name: "Sam's Snacks")
      @sinclair  = owner.machines.create(location: "Sinclair gas station")
      reeses = Snack.create(name: "Reeses", price: 1)
      lara_bar = Snack.create(name: "Lara Bar", price: 2)
      fig_newton = Snack.create(name: "Fig Newton", price: 2)
      MachineSnack.create(machine_id: @sinclair.id, snack_id: fig_newton.id)
      MachineSnack.create(machine_id: @sinclair.id, snack_id: reeses.id)
      MachineSnack.create(machine_id: @sinclair.id, snack_id: lara_bar.id)
  end
    it "can calculate snack count" do
      expect(@sinclair.snack_count).to eq(3)
    end
    it "can calculate average snack price" do
      expect(@sinclair.average_snack_price).to eq(1.67)
    end
  end




end
