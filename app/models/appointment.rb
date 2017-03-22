class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :rabbi #, optional: true
  belongs_to :service

  validates :starttime, presence: true
  #validates_associated :rabbi

  accepts_nested_attributes_for :rabbi


  scope :future_appointments, -> (user_id) {where("user_id = ? AND starttime > ?",user_id, Time.now )}


  def rabbi_attributes=(attributes)
    #unless attributes.values.any? { |value| value.blank? }

      self.rabbi = Rabbi.find_or_create_by(attributes)

    #end
  end

end
