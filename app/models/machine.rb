class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def average_snack_price
    if snacks.size > 0
      sum = snacks.sum { |snack| snack.price }
      (sum/snacks.size).round(2)
    end
    # Snack.where(machine_id: id).average(:price)
  end
end
