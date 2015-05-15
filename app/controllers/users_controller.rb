class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!

  def show
    if current_user.id == params[:id]
      render
    else
      authenticate_user!
    end
  end

  private

    def set_user
      if params[:id]
        @user = User.find(params[:id])
      else
        @user = current_user
      end
    end
end
