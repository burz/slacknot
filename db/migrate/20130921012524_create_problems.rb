class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.text :prompt
      t.text :text
      t.text :latex
      t.text :notes
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
