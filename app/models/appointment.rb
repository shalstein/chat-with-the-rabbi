class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :rabbi
  belongs_to :service

  def rabbi_attributes=(attributes)
    attributes.each do |key, value|
      binding.pry
      Rabbi.find_or_create_by(name: key[:name])
    end

  end
end
