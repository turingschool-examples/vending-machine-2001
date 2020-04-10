class Machine < ApplicationRecord
  validates_presence_of :location

  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks
  belongs_to :owner

  def avg_price
    snacks.empty? ? ("There are no snacks.") : ('%.2f' % snacks.average(:price))
  end
end
