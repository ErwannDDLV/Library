class RenameColumnStateToIsAvailableToBooks < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :state, :is_available
  end
end
