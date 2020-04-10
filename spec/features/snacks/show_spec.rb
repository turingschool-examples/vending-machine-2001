require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do
  scenario 'they see details about the snack and where to buy it' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snod  = owner.machines.create(location: "Snod's Homogeneous Solids")
    penut_mms = Snack.create(name: "Penut MMs", price: "100.85")


    visit snack_path(dons)

    expect(page).to have_content(penut_mms.name)
    expect(page).to have_content(penut_mms.price)
    within 'section.snack-locations' do
      expec(page).to have_content(dons.location)
      expect(page).to_not have_content(snod.location)     
    end

  end
end
