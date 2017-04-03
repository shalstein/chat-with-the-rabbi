class RabbisController < ApplicationController

  def index
    @rabbi = Rabbi.all
  end

  def new
    @rabbi = Rabbi.new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

end
