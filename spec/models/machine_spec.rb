require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'instance methods' do
    it "average_price" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      twix = Snack.create(name: 'Twix', price: 2, owner_id: owner.id)
      reeses = Snack.create(name: 'Reeses', price: 3, owner_id: owner.id)
      dons.machine_snacks.create(machine_id: dons.id, snack_id: twix.id, price:twix.price, quantity:3)
      dons.machine_snacks.create(machine_id: dons.id, snack_id: reeses.id, price:reeses.price, quantity:5)

      expect(dons.average_price).to eql(2.5)
    end

    it "other_item_count" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      twix = Snack.create(name: 'Twix', price: 2, owner_id: owner.id)
      reeses = Snack.create(name: 'Reeses', price: 3, owner_id: owner.id)
      dons.machine_snacks.create(machine_id: dons.id, snack_id: twix.id, price:twix.price, quantity:3)
      dons.machine_snacks.create(machine_id: dons.id, snack_id: reeses.id, price:reeses.price, quantity:5)

      expect(dons.item_count).to eql(2)
    end
  end
end
