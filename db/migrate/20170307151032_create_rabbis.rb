class CreateRabbis < ActiveRecord::Migration[5.0]
  def change
    create_table :rabbis do |t|
      t.string :first_name
      t.string :last_name
      t.string :branch_of_judaism
      t.string :temple
      t.string :city
      t.string :charisma_level, default: 1
      t.date :dob
      t.timestamps
    end
  end
end
