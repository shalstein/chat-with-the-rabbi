class Rabbi < ApplicationRecord
  before_save :downcase_and_strip


  validates :first_name, :last_name, presence: true
  validates :first_name, uniqueness: {scope: :last_name}

  has_many :appointments, inverse_of: :rabbi
  has_many :users, through: :appointments

  def future_appointments
    appointments.where("time_and_date > ?", Time.current)
  end

  def client_count
    users.distinct.count
  end

  private

  def downcase_and_strip
    first_name.strip!.capitalize!
    last_name.strip!.capitalize!
  end

end
