class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :body
      t.belongs_to :bug, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
