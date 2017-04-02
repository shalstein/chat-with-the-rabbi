class CreateRabbis < ActiveRecord::Migration[5.0]
  def change
    create_table :rabbis do |t|
      t.string :name
      t.string :branch_of_judaism
      t.string :temple
      t.string :city
      t.string :charisma_level
      t.date :dob
      t.timestamps
    end
  end
end
