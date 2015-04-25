class AddUnitSubscriptionIdToQuizzes < ActiveRecord::Migration
  def change
    add_reference :quizzes, :unit_subscription, index: true
  end
end
