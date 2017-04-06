class Rabbi < ApplicationRecord


  validates :name, :charisma_level, :dob, presence: true
  validates :charisma_level, numericality: {only_integer: true, less_than_or_equal_to: 5}
  validates :name, uniqueness: true

  has_many :appointments, inverse_of: :rabbi
  has_many :users, through: :appointments

  def future_appointments
    appointments.where("starttime > ?", Time.current)
  end

  def client_count
    users.distinct.count
  end

end
