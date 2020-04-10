class Snack < ApplicationRecord
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  def self.average_price
    return average(:price) unless all.empty?
    0
  end
end
