class Rabbi < ApplicationRecord


  validates :first_name, :last_name, presence: true
  validates :first_name, uniqueness: {scope: :last_name}

  has_many :appointments, inverse_of: :rabbi
  has_many :users, through: :appointments

  def future_appointments
    appointments.where("starttime > ?", Time.current)
  end

  def client_count
    users.distinct.count
  end

end
