class CreateVocables < ActiveRecord::Migration
  def change
    create_table :vocables do |t|
      t.string :german
      t.string :english
      t.string :swedish
      t.reference :unit

      t.timestamps null: false
    end
  end
end
