class MachineSnack < ApplicationRecord
  validates_presence_of :machine_id, :snack_id, :price, :quantity
  belongs_to :machine
  belongs_to :snack
end
