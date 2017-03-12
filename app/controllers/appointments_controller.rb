class AppointmentsController < ApplicationController

  def new
    @appointment = User.find(params[:user_id]).appointments.build
    @rabbi = @appointment.build_rabbi
  end

end
