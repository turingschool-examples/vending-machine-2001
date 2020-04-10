require 'rails_helper'

describe Snack, type: :model do
  describe 'relationships' do
    it {should have_many :snack_machines}
    it {should have_many(:machines).through(:snack_machines)}
  end
end 
