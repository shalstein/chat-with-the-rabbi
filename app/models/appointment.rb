class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :rabbi
  belongs_to :service
end
