class RabbisController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @rabbis = Rabbi.all
  end

  def new
    @rabbi = Rabbi.new
  end

  def show
    @rabbi = Rabbi.find(params[:id])
    @upcoming_appoitments_count = @rabbi.future_appointments.count
  end

  def create
    @rabbi = Rabbi.new(rabbi_params)
    if @rabbi.save
      redirect_to rabbi_path(@rabbi)
    else
      render :new
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
    params.require(:rabbi).permit(:name, :dob, :branch_of_judaism, :charisma_level)
  end

end
