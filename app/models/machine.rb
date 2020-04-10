class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :machine_snack
  has_many :snacks, through: :machine_snack

  def average_snack_price
    snacks.average(:price)
  end
end
