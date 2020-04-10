class AddOwnerIdToSnacks < ActiveRecord::Migration[5.1]
  def change
    add_reference :snacks, :owner, foreign_key: true
  end
end
