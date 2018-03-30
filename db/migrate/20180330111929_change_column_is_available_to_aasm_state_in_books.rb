class ChangeColumnIsAvailableToAasmStateInBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :is_available, :boolean
    add_column :books, :aasm_state, :string
  end
end
