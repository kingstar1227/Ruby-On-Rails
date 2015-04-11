class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :answer
      t.timestamps null: false
    end
    add_reference :questions, :vocable, index: true
  end
end
