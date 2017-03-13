class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @appointment = User.find(params[:user_id]).appointments.build
    @rabbi = @appointment.build_rabbi
  end

  def create
    user = User.find_by(id: params[:user_id])
    appointment = user.appointments.build(appointment_attributes)
    user.save
    redirect_to user_appointment_path(user, appointment )
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
  end

  private

  def appointment_attributes
    params.require(:appointment).permit(:rabbi_id, :service_id, :time, :date, rabbi_attributes: [:name, :age, :years_of_experience, :branch_of_judaism, :charisma_level])
  end

end
