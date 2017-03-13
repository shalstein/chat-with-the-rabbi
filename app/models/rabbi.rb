class Rabbi < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments

  validates :name, :age, :years_of_experience, :charisma_level, presence: true
end
