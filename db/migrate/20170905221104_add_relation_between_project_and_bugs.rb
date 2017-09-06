class AddRelationBetweenProjectAndBugs < ActiveRecord::Migration[5.1]
  def change
    add_reference :bugs, :project, index: true
  end
end
