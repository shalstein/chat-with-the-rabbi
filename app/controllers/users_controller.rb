class UsersController < ApplicationController
  before_action :authenticate_user!

  def show

    @user = User.find(params[:id])
    authorize! :read, @user
    @appointments = @user.appointments

    respond_to do |response|
      response.html {render :show}
      response.json {render json: @user}
    end
  end

  def index
    @users = User.all
    authorize! :read, @users
    render json: @users.to_json(only: [:name, :id])
  end


end
