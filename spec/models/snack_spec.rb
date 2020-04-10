require "rails_helper"

RSpec.describe Snack do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
  end
end


# User Story 3 of 3
#
# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.```
