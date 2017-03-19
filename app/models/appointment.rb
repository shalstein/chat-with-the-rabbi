class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :rabbi
  belongs_to :service

  scope :future_appointments, -> (user_id) {where("user_id = ? AND starttime > ?",user_id, Time.now )}


  def rabbi_attributes=(attributes)
    unless attributes.values.any? { |value| value.blank? }
      self.rabbi = Rabbi.find_or_create_by(attributes)
    end
  end

end
