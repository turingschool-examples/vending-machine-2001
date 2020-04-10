require 'rails_helper'

RSpec.describe Owner, type: :model do

  describe 'relationships' do
    it {should have_many :machines}
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should have_many :machines }
  end
end
