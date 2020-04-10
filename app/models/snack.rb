class Snack < ApplicationRecord
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  def self.average_price
    "#{average(:price).round(2)}"
  end

  def currency_price
    "$#{price}".ljust(5, '0')
  end

end
