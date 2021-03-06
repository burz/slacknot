class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.text :prompt
      t.text :latex
      t.text :notes
      t.boolean :completed, default: false

      t.references :assignment, index: true

      t.timestamps
    end
  end
end
