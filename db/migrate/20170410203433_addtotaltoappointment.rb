class Addtotaltoappointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :total, :integer
  end
end
