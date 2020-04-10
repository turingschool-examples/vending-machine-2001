require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe 'instance methods' do
    it 'average_snack_price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    penut_mms = Snack.create(name: "Penut MMs", price: "100.85")
    tacos = Snack.create(name: "Street Taco", price: "8.40")
    dons.snacks << penut_mms
    dons.snacks << tacos
      
    expect(dons.average_snack_price).to eq("54.625")
    end
    
  end
end