class AddMobileNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Mobile_number, :string
    add_column :users, :Gender, :string
    add_column :users, :Address, :string
  end
end
