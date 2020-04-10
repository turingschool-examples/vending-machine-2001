class Snack < ApplicationRecord
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks
  validates_presence_of :name, :price

  def display_price
    "$#{sprintf('%.2f', price)}"
  end
end
