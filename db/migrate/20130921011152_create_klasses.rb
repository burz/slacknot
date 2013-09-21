class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string :name

      t.references :user, index: true

      t.timestamps
    end
  end
end
