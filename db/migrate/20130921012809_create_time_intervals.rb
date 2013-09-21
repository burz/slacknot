class CreateTimeIntervals < ActiveRecord::Migration
  def change
    create_table :time_intervals do |t|
      t.datetime :start
      t.datetime :end

      t.references :problem, index: true

      t.timestamps
    end
  end
end
