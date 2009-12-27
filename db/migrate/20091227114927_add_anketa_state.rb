class AddAnketaState < ActiveRecord::Migration
  def self.up
     add_column :anketas, :state, :string
  end

  def self.down
    remove_column :anketas, :state
  end
end
