class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :rabbi
  belongs_to :service

  def rabbi_attributes=(attributes)
    unless attributes.values.any? { |value| value.blank? }
      rabbi = Rabbi.find_or_create_by(attributes)
    end
  end

end
