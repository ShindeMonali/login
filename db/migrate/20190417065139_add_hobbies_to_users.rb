class AddHobbiesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hobbies, :string
  end
end
