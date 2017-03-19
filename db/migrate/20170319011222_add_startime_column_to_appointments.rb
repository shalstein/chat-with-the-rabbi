class AddStartimeColumnToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :starttime, :datetime
  end
end
