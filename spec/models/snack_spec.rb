require 'rails_helper'

RSpec.describe Snack, type: :model do
  before (:each) do
    @snack_1 = Snack.create(name: "White Castle Burger", price: 3.5)
    @snack_2 = Snack.create(name: "Pop Rocks", price: 1.14999999)
    @snack_3 = Snack.create(name: "Flaming Hot Cheetos", price: 2.0)
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should have_many :machine_snacks }
    it { should have_many :machines }
  end

  describe 'methods' do
    it "#display_price" do
      expect(@snack_1.display_price).to eq("$3.50")
      expect(@snack_2.display_price).to eq("$1.15")
      expect(@snack_3.display_price).to eq("$2.00")
    end
  end
end
