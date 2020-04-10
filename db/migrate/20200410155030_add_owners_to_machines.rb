class AddOwnersToMachines < ActiveRecord::Migration[5.1]
  def change
    add_reference :machines, :owner, foreign_key: true
  end
end
