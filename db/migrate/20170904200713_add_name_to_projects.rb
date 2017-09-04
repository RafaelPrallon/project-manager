class AddNameToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :name, :string
    add_index :projects, :name, unique: true
  end
end
