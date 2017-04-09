class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :rabbi
  belongs_to :service

  validates :time_and_date, :service_id, presence: true
  accepts_nested_attributes_for :rabbi

  validate :appointment_must_not_conflict_other_appointments





  scope :future_appointments, -> (user_id) {where("user_id = ? AND time_and_date > ?",user_id, Time.current )}

  def rabbi_attributes=(attributes)
    self.rabbi = Rabbi.find_or_create_by(attributes)
  end


  def charge
    user.update(wallet: user.wallet - service.fee) if enough_money?
  end

  private

  def enough_money?
    user.wallet >= service.fee
  end

  def appointment_must_not_conflict_other_appointments
    errors.add(:time_and_date, "already taken by another appointment") if rabbi.appointments.exists?(time_and_date: (time_and_date - 15.minutes..time_and_date + 1.hours))
  end




end
