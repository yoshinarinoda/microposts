class AddAgeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :intege
  end
end
