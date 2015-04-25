class AddAssociationsToUnitSubscription < ActiveRecord::Migration
  def change
    add_reference :unit_subscriptions, :user, index: true
    add_reference :unit_subscriptions, :unit, index: true
  end
end
