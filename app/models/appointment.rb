class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :rabbi
  belongs_to :service

  validates :starttime, :service_id, :rabbi_id, presence: true

  # accepts_nested_attributes_for :rabbi?


  scope :future_appointments, -> (user_id) {where("user_id = ? AND starttime > ?",user_id, Time.current )}


  def rabbi_attributes=(attributes)
    unless attributes.values.all? { |value| value.blank? }
      self.rabbi = Rabbi.find_or_create_by(attributes)
    end
  end

    def charge
      user.update(wallet: user.wallet - service.fee) if enough_money?
    end

    def enough_money?
      user.wallet >= service.fee
    end



end
