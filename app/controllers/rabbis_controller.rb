class RabbisController < ApplicationController

  def index
    @rabbi = Rabbi.all
  end

  def new
    @rabbi = Rabbi.new
  end

  def show
    @rabbi = Rabbi.find(params[:id])
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
  end

  def update
  end

  def delete
  end

  private

  def rabbi_params
    params.require(:rabbi).permit(:name, :dob, :branch_of_judaism, :charisma_level)
  end

end
