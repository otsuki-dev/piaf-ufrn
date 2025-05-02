class AddAddressToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :rg_user, :string
    add_column :users, :address, :string
    add_column :users, :cep, :string
    add_column :users, :district, :string
  end
end
