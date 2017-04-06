class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @user = requested_user
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
      if @appointment.charge
        redirect_to user_appointment_path(@user, @appointment)
      else
        redirect_to edit_user_money_path(@user), alert: "You don't have enough money for this appointment!"
      end
    else

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
    params.require(:appointment).permit(:rabbi_id, :service_id, :starttime, :time, :date, rabbi_attributes: [:first_name, :last_name])
  end

  def requested_appointment
    Appointment.find_by(id: params[:id])
  end

  def requested_user
    @user = User.find_by(id: params[:user_id])
  end


end
