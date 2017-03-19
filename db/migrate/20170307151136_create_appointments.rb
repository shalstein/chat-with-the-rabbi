class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :rabbi
      t.belongs_to :user
      t.belongs_to :service
      t.timestamps
    end
  end
end
