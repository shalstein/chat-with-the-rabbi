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
    render json: @users.to_json(only: [:name, :id])
  end

  def edit_wallet
    @user = User.find(params[:user_id])
    authorize! :edit, @user
  end

  def update_wallet
    @user = User.find(params[:user_id])

    if @user.update(wallet: @user.wallet += params[:wallet].to_i)
      redirect_to user_path(@user), alert: "You sucssefuly added money to your account."
    else
      render :edit_wallet
    end
  end

end
