require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :snacks }
  end

  describe "#average_snack_price" do
    it "returns average snack price" do
    sam = Owner.create!(name: "Sam's Snacks")
    sam.machines.create!(location: "Don's Mixed Drinks")
    sam.machines.first.snacks.create!(name: "Doritos", price: 2.99)
    sam.machines.first.snacks.create!(name: "Cheetos", price: 1.99)
    sam.machines.first.snacks.create!(name: "Fritos", price: 1.59)

    expect(sam.machines.first.average_snack_price).to eq(2.19)
  end
  end
end
