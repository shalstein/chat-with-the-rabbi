class Rabbi < ApplicationRecord


  validates :name, :age, :years_of_experience, :charisma_level, presence: true
  has_many :appointments, inverse_of: :rabbi
  has_many :users, through: :appointments
end
