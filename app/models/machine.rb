class Machine < ApplicationRecord
  validates_presence_of :location
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks
  belongs_to :owner

  def average_snack_price
    snacks.average(:price)
  end

  def display_average_snack_price
    if average_snack_price
      "$#{sprintf('%.2f', average_snack_price)}"
    end
  end
end
