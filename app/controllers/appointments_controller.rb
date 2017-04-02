class AppointmentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @appointments = Appointment.future_appointments(@user.id)
  end

  def new
    @user = requested_user
    @appointment = @user.appointments.build
    @rabbi = Rabbi.new
  end

  def create
    @user = requested_user
    @appointment = @user.appointments.build(appointment_params)

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

    if @appointment.update(appointment_params)
      redirect_to user_appointment_path(@user, @appointment)
    else
      @appointment.rabbi ||= @appointment.build_rabbi
      render "edit"
    end

  end

  def destroy
    @user = requested_user
    @appointment = @user.appointments.find(params[:id])
    @appointment.destroy
    redirect_to user_appointments_path(@user)
  end


  private



  def appointment_params
    params.require(:appointment).permit(:rabbi_id, :service_id, :starttime, :time, :date, rabbi_attributes: [:name, :dob, :branch_of_judaism, :charisma_level])
  end

  def requested_appointment
    Appointment.find_by(id: params[:id])
  end

  def requested_user
    User.find_by(id: params[:user_id])
  end


end
