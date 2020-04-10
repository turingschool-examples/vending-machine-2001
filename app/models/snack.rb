class Snack < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :price

  has_many :machines
end
