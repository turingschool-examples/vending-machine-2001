require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'relationships' do
    it { should have_many :machine_snacks }
    it { should have_many(:machines).through(:machine_snacks) }
  end

  # describe "methods" do
  #   it "can return snack_count"
  #   end
  # end
end