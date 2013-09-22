class AddPreambleToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :preamble, :text, default: '\usepackage[margin=1in]{geometry}'
  end
end
