class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.date :assigned_on
      t.date :due_on
      t.integer :percent_completed

      t.references :klasses, index: true

      t.timestamps
    end
  end
end
