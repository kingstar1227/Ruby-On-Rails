class RemoveUnitIdFromQuizzes < ActiveRecord::Migration
  def change
    remove_column :quizzes, :unit_id
  end
end
