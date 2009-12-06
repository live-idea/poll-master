class CreatePolls < ActiveRecord::Migration
  def self.up
    create_table :polls do |t|
      t.string :title, :branch, :location
      t.string :state, :default => 'draft'
      t.text :description
      t.date :start_date, :end_date
      t.integer :user_id
  
      t.timestamps
    end
  end

  def self.down
    drop_table :polls
  end
end
