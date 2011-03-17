class AddExtrasToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :active, :boolean
    add_column :users, :is_faculty, :boolean
  end

  def self.down
    remove_column :users, :is_faculty
    remove_column :users, :active
    remove_column :users, :last_name
    remove_column :users, :first_name
  end
end
