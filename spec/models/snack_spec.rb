require "rails_helper"

RSpec.describe Snack do
  describe "relationship" do
    it {should have_many :machine_snacks}
    it {should have_many(:machines).through(:machine_snacks)}
  end

  describe "class methods" do
    it "can return average price of all snacks" do
      Snack.create(name: "soda", price: 3.50)
      Snack.create(name: "chips", price: 1.50)
      Snack.create(name: "cheetos", price: 2.51)

      expect(Snack.average_price.round(2)).to eql(2.50)
    end
  end




end
