class Machine < ApplicationRecord
  validates_presence_of :location
  
  belongs_to :owner
  has_many :snack_machines
  has_many :snacks, through: :snack_machines

  def average_snack_price
    # snacks.average(:price)
    all_prices = snacks.map do |snack|
      snack.price
    end
    (all_prices.sum.to_f / all_prices.length).round(2)
  end

  def snack_count
    snacks.count
  end
end
