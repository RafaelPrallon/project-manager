class RemoveStatusFromBugs < ActiveRecord::Migration[5.1]
  def change
    remove_column :bugs, :status
  end
end
