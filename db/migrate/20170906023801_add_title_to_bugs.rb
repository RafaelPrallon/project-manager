class AddTitleToBugs < ActiveRecord::Migration[5.1]
  def change
    add_column :bugs, :title, :string
    add_index :bugs, :title, unique: true
  end
end
