class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.string :name
      t.string :lowest_unit
      t.float :lowest_unit_equivalence

      t.timestamps
    end
  end
end
