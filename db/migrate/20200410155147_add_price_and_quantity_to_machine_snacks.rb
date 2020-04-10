class AddPriceAndQuantityToMachineSnacks < ActiveRecord::Migration[5.1]
  def change
    add_column :machine_snacks, :price, :integer
    add_column :machine_snacks, :quantity, :integer
  end
end
