require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'relationships' do
    it {should have_many :snack_machines}
    it {should have_many(:snacks).through(:snack_machines)}
  end

  describe "instance methods" do

    it "#average_price" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      burger = dons.snacks.create!(name: "White Castle Burger",
                                  price: 3.50)
      poprocks = dons.snacks.create!(name: "Pop Rocks",
                                  price: 1.50)
      cheetos = dons.snacks.create!(name: "Flaming Hot Cheetos",
                                  price: 2.50)
    expect(dons.average_snack_price).to eq(2.50)
    end

    it "#snack_count" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      turing  = owner.machines.create(location: "Turing Basement")
      burger = dons.snacks.create!(name: "White Castle Burger",
                                  price: 3.50)
      poprocks = dons.snacks.create!(name: "Pop Rocks",
                                  price: 1.50)
      cheetos = dons.snacks.create!(name: "Flaming Hot Cheetos",
                                  price: 2.50)
      cheetos = turing.snacks.create!(name: "Flaming Hot Cheetos",
                                      price: 2.50)
      poprocks = turing.snacks.create!(name: "Pop Rocks",
                                        price: "1.50")

      expect(turing.snack_count).to eq(2)
      expect(dons.snack_count).to eq(3)
    end                              
  end
end
