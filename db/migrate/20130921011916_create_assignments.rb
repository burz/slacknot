class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.date :assigned_on
      t.date :due_on

      t.references :klass, index: true

      t.timestamps
    end
  end
end
