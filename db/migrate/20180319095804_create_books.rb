class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :resume
      t.boolean :state

      t.timestamps
    end
  end
end
