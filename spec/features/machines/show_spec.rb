require 'rails_helper'

describe "As a visitor", type: :feature do
  it "can see the name of all the snacks' names and their prices" do
    snack1 = Snack.create(name: "Hersheys",
                          price: "1.50")
    snack2 = Snack.create(name: "Skittles",
                          price: "2.50")
    snack3 = Snack.create(name: "Lays",
                          price: "2.50")
    snack4 = Snack.create(name: "Pop Tarts",
                          price: "3.00")
    machine_1 = Machine.create(snack_1: snack1.id,
                               snack_2: snack2.id,
                               snack_3: snack3.id)
                             
    machine_2 = Machine.create(snack_1: snack1.id,
                               snack_2: snack2.id,
                               snack_3: snack3.id,
                               snack_4: snack4.id)
                              
    visit "/machines/#{machine_1.id}"

    expect(page).to have_content(machine_1.name)
    expect(page).to have_content(machine_1.snack_1)
    expect(page).to have_content(machine_1.snack_2)
    expect(page).to have_content(machine_1.snack_3)
  end
end


# As a visitor
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price
