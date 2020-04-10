require 'rails_helper'

RSpec.describe 'When a user visits a snacks show page', type: :feature do
  scenario 'they see the info for that snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    sinclair  = owner.machines.create(location: "Sinclair gas station")
    reeses = Snack.create(name: "Reeses", price: 1)
    lara_bar = Snack.create(name: "Lara Bar", price: 2)
    fig_newton = Snack.create(name: "Fig Newton", price: 2)

    MachineSnack.create(machine_id: dons.id, snack_id: reeses.id)
    MachineSnack.create(machine_id: dons.id, snack_id: lara_bar.id)
    MachineSnack.create(machine_id: sinclair.id, snack_id: fig_newton.id)
    MachineSnack.create(machine_id: sinclair.id, snack_id: reeses.id)
    MachineSnack.create(machine_id: sinclair.id, snack_id: lara_bar.id)


    visit "/snacks/#{reeses.id}"

    expect(page).to have_content(reeses.name)
    expect(page).to have_content("Price: $#{reeses.price}")

    within ".locations" do
        expect(page).to have_content(dons.location)
        expect(page).to have_content(dons.average_snack_price)
        expect(page).to have_content("#{dons.snack_count} kinds of snacks")
        expect(page).to have_content(sinclair.location)
        expect(page).to have_content(sinclair.average_snack_price)
        expect(page).to have_content("#{sinclair.snack_count} kinds of snacks")
    end

  end
end
