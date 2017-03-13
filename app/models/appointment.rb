class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :rabbi
  belongs_to :service

  def rabbi_attributes=(attributes)
    self.rabbi = Rabbi.find_or_create_by(attributes)
  end

end
