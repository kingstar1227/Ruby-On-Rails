class CreateUnitSubscriptions < ActiveRecord::Migration
  def change
    create_table :unit_subscriptions do |t|
      t.integer :score

      t.timestamps null: false
    end
  end
end
