class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|

      t.timestamps null: false
    end
    add_reference :quizzes, :unit, index:true
  end
end
