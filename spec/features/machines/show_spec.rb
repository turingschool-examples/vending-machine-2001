require 'rails_helper'

RSpec.describe "When a user visits the vending machine show", type: :feature do
  scenario "they see a list of names of prices of snacks at this machine" do
    sam = Owner.create!(name: "Sam's Snacks")
    sam.machines.create!(location: "Don's Mixed Drinks")
    sam.machines.first.snacks.create!(name: "Doritos", price: 2.99)
    sam.machines.first.snacks.create!(name: "Cheetos", price: 1.99)
    sam.machines.first.snacks.create!(name: "Fritos", price: 1.59)


    visit machine_path(sam.machines.first)

    expect(current_path).to eq ("/machines/#{sam.machines.first.id}")
    expect(page).to have_content("Doritos $2.99")
    expect(page).to have_content("Cheetos $1.99")
    expect(page).to have_content("Fritos $1.59")
  end
end
