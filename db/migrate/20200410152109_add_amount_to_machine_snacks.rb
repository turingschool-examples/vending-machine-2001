class AddAmountToMachineSnacks < ActiveRecord::Migration[5.1]
  def change
    add_column :machine_snacks, :amount, :integer
  end
end
