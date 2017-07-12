class RabbisController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @rabbis = Rabbi.all
    @rabbi = Rabbi.new
  end

  def new
    @rabbi = Rabbi.new
  end

  def show
    @rabbi = Rabbi.find(params[:id])
    @upcoming_appoitments_count = @rabbi.future_appointments.count
    respond_to do |response|
      response.html {render :show}
      response.json {render json: @rabbi}
    end

  end

  def create
    @rabbi = Rabbi.new(rabbi_params)
    if @rabbi.save
      respond_to do |response|
        response.html {redirect_to rabbi_path(@rabbi)}
        response.json {render json: { rabbi: @rabbi, isAdmin: current_user.admin? }}
      end
    else
      respond_to do |response|
        response.html { render :new }
        response.json {render json: "invalid input"}
      end
    end
  end

  def edit
    @rabbi = Rabbi.find(params[:id])
  end

  def update
    @rabbi = Rabbi.find(params[:id])

    if @rabbi.update(rabbi_params)
      redirect_to rabbi_path(@rabbi), alert: "Sucssefully updated Rabbi profile."
    else
      render :edit
    end

  end


  def destroy
    @rabbi = Rabbi.find(params[:id])
    @rabbi.destroy
    redirect_to rabbis_path, alert: "Sucssefully delteted Rabbi."
  end

  private

  def rabbi_params
    params.require(:rabbi).permit(:first_name, :last_name, :dob, :branch_of_judaism, :charisma_level)
  end

end
