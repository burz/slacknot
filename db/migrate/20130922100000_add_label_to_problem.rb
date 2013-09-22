class AddLabelToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :label, :string
  end
end
