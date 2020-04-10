class Snack < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :price

  belongs_to :owner
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks
end
