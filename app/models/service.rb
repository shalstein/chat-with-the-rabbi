class Service < ApplicationRecord
  has_many :appointments, inverse_of: :service
end
