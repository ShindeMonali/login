class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :User_name
      t.string :Email
      t.string :Password
      t.string :Confirm_password

      t.timestamps
    end
  end
end
