class CreateVocables < ActiveRecord::Migration
  def change
    create_table :vocables do |t|
      t.string :german
      t.string :english
      t.string :swedish

      t.timestamps null: false
    end
    add_reference :vocables, :unit, index: true
  end
end
