class Rabbi < ApplicationRecord


  validates :name, :age, :years_of_experience, :charisma_level, presence: true
  validates :age, :years_of_experience, numericality: {only_integer: true, less_than_or_equal_to: 120 }
  validates :charisma_level, numericality: {only_integer: true, less_than_or_equal_to: 5}
  validates :branch_of_judaism, uniqueness: true

  has_many :appointments, inverse_of: :rabbi
  has_many :users, through: :appointments
end
