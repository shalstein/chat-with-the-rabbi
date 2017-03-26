class UsersController < ApplicationController
  before_action :authenticate_user!

  def show

    @user = User.find(params[:id])
    authorize! :read, @user
    @appointments = @user.appointments
  end
end
