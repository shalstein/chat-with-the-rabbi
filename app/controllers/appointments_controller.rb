class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @appointments = Appointment.future_appointments(@user.id)
  end

  def new
    @user = requested_user
    @appointment = @user.appointments.build
    @rabbi = @appointment.build_rabbi
  end

  def create
    user = requested_user
    if params.require(:appointment).permit(:rabbi_id).blank?
      appointment = user.appointments.build(appointment_and_rabbi_attributes)
    else
      appointment = user.appointments.build(appointment_attributes)
    end
    user.save
    redirect_to user_appointment_path(user, appointment)
  end

  def show
    @user = requested_user
    @appointment = @user.appointments.find(params[:id])
  end

  def edit
    @user = requested_user
    @appointment = @user.appointments.find(params[:id])
  end

  def update
    appointment = requested_appointment
    if params.require(:appointment).permit(:rabbi_id).blank?
      appointment.update(appointment_and_rabbi_attributes)
    else
      appointment.update(appointment_attributes)
    end
    redirect_to user_appointment_path(appointment.user, appointment)
  end


  private

  def appointment_attributes
    params.require(:appointment).permit(:rabbi_id, :service_id, :time, :date)
  end

  def appointment_and_rabbi_attributes
    params.require(:appointment).permit(:rabbi_id, :service_id, :time, :date, rabbi_attributes: [:name, :age, :years_of_experience, :branch_of_judaism, :charisma_level])
  end

  def requested_appointment
    Appointment.find_by(id: params[:id])
  end

  def requested_user
    User.find_by(id: params[:user_id])
  end

end
