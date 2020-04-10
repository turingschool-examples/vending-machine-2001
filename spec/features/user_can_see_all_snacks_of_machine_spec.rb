require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @owner = Owner.create(name: "Sam's Snacks")
    @machine = @owner.machines.create(location: "Don's Mixed Drinks")
    @snack1 = Snack.create(name: "Twix", price: 1.00)
    @snack2 = Snack.create(name: "Snickers", price: 1.50)
    @snack3 = Snack.create(name: "Reeses", price: 2.50)
    @machine.snacks << @snack1
    @machine.snacks << @snack2
    @machine.snacks << @snack3
  end
describe 'When I visit /machines/:id'
  it 'I see all of the snacks in the machine along with their price' do
    visit "/machines/#{@machine.id}"

    within "#snack-#{@snack1.id}" do
      expect(page).to have_content(@snack1.name)
      expect(page).to have_content("$1.00")
    end
    within "#snack-#{@snack2.id}" do
      expect(page).to have_content(@snack2.name)
      expect(page).to have_content("$1.50")
    end
    within "#snack-#{@snack3.id}" do
      expect(page).to have_content(@snack3.name)
      expect(page).to have_content("$2.50")
    end
  end

end
