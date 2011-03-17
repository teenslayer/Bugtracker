class CreateDefects < ActiveRecord::Migration
  def self.up
    create_table :defects do |t|
      t.integer :project_id
      t.text :summary
      t.text :details
      t.datetime :created_at
      t.integer :reporter_id
      t.integer :resolver_id
      t.datetime :resolved_at
      t.integer :source_id
      t.string :severity
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :defects
  end
end
