class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :sex
      t.string :colour
      t.date :dateofbirth
      t.string :favouritefood
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
