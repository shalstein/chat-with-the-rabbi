class AddStartimeColumnToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :time_and_date, :datetime
  end
end
