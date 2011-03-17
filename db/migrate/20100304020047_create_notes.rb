class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.integer :defect_id
      t.integer :user_id
      t.datetime :date
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
