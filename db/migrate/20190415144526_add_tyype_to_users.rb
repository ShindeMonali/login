class AddTyypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tyype, :string
  end
end
