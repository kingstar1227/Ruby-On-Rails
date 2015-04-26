class UnitSubscriptionsController < ApplicationController
  before_action :set_unit_subscription, only: [:show]

  def create
    @unit_subscription = UnitSubscription.new(sub_params)
    if @unit_subscription.valid?
      @unit_subscription.save
      redirect_to @unit_subscription
    else
      flash[:notice] = "You already started learning this class"
      redirect_to units_path
    end
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
