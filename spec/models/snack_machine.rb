require 'rails_helper'

RSpec.describe SnackMachine, type: :model do
  describe 'validations' do
    # it { should validate_presence_of :}
  end

  describe 'relationships' do
    it {should belong_to :machine}
    it {should belong_to :snack}
    
  end

  describe 'instance methods' do
  end
end