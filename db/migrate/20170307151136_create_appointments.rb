class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :rabbi
      t.belongs_to :user
      t.belongs_to :service
      t.integer :cost, default: 0
      t.timestamps
    end
  end
end
