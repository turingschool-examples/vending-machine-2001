require 'rails_helper'

RSpec.describe Machine, type: :model do

  describe 'relationships' do
    it {should belong_to :owner}
    it {should have_many :machine_snacks}
    it {should have_many(:snacks).through(:machine_snacks)}
  end

  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end
end
