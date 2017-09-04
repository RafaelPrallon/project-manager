class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
