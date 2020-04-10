require 'rails_helper'

RSpec.describe Snack do

  describe 'relationships' do
    it {should have_many :machine_snacks}
    it {should have_many(:machines).through(:machine_snacks)}
  end

  describe 'instance methods' do
    snack1 = Snack.create(name: "Twix", price: 1.00)

    it 'currency_price' do
      expect(snack1.currency_price).to eq("$1.00")
    end

  end

end
