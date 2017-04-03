class Rabbi < ApplicationRecord


  validates :name, :charisma_level, presence: true
  validates :charisma_level, numericality: {only_integer: true, less_than_or_equal_to: 5}
  validates :name, uniqueness: {scope: :dob}

  has_many :appointments, inverse_of: :rabbi
  has_many :users, through: :appointments

  def future_appointments #try to make it do 1 sql query instead of 2
    appointments.where("starttime > ?", Time.now)
  end

  def client_count
    users.distinct.count
  end

end
