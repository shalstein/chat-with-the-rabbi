class AddColumnWalletToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :wallet, :integer
  end
end
