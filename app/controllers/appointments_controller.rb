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
    @user = requested_user
    @appointment = @user.appointments.build(appointment_and_rabbi_attributes)

    if @appointment.save
       redirect_to user_appointment_path(@user, @appointment)
    else
      @appointment.rabbi ||= @appointment.build_rabbi
      render :new
    end

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
    @user = requested_user
    @appointment = requested_appointment

    if @appointment.update(appointment_and_rabbi_attributes)
      redirect_to user_appointment_path(@user, @appointment)
    else
      @appointment.rabbi ||= @appointment.build_rabbi
      render "edit"
    end

  end


  private

  def appointment_attributes
    params.require(:appointment).permit(:rabbi_id, :service_id, :time, :date, :starttime)
  end

  def appointment_and_rabbi_attributes
    params.require(:appointment).permit(:rabbi_id, :service_id, :starttime, :time, :date, rabbi_attributes: [:name, :age, :years_of_experience, :branch_of_judaism, :charisma_level])
  end

  def requested_appointment
    Appointment.find_by(id: params[:id])
  end

  def requested_user
    User.find_by(id: params[:user_id])
  end


end
