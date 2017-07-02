class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :rabbi
  belongs_to :service

  validates :time_and_date, :service_id, presence: true
  accepts_nested_attributes_for :rabbi

  validate :does_not_conflict_other_appointments, :during_regular_hours, :not_on_saturday




  scope :future_appointments, -> (user_id) {where("user_id = ? AND time_and_date > ?",user_id, Time.current )}



  def rabbi_attributes=(attributes)
    self.rabbi = Rabbi.find_or_create_by(attributes)


  end


  def charge
    update(cost: service.fee + ((service.fee / 100) * charisma_percentage_fee))
    user.update(wallet: user.wallet - cost) if enough_money?
  end

  def refund
    user.update(wallet: user.wallet + cost)
  end

  def adjust_charges
    refund
    charge
  end

  private

  def charisma_percentage_fee
    case rabbi.charisma_level
      when "5"
        25
      when "4"
        20
      when "3"
        15
      when "2"
        10
      when "1"
        5
      else
        0
    end
  end





  def enough_money?
    user.wallet >= cost
  end

  def does_not_conflict_other_appointments
    errors.add(:time_and_date, "already taken by another appointment") if time_and_date &&  rabbi.appointments.where(time_and_date: (time_and_date - 15.minutes..time_and_date + 1.hours)).where.not(user_id: user_id).exists?
  end

  def during_regular_hours
    errors.add(:time_and_date, "not during regular hours") unless time_and_date && time_and_date.strftime("%H%M").to_i >= 830 && time_and_date.strftime("%H%M").to_i <= 1830
  end

  def not_on_saturday
    errors.add(:time_and_date, "can not be on saturday") if time_and_date && time_and_date.saturday?
  end





end
