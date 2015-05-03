class UnitSubscriptionsController < ApplicationController
  before_action :set_unit_subscription, only: [:show]

  def create
    @unit_subscription = UnitSubscription.find_or_create_by(sub_params)
    redirect_to @unit_subscription
  end

  def show
  end

  private
    def sub_params
      params.permit(:unit_id,:user_id)
    end

    def set_unit_subscription
      @unit_subscription = UnitSubscription.find(params[:id])
    end
end
