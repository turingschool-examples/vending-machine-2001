class Machine < ApplicationRecord
  include ActionView::Helpers

  validates_presence_of :location

  belongs_to :owner
  has_many :snack_machines
  has_many :snacks, through: :snack_machines

  def average_snack_price
    avg = (snacks.average(:price))
    sprintf("%.2f", avg.truncate(2))
  end
end
