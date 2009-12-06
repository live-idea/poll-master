class CreateResaults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.integer :anketa_id, :responder_id, :percentage
      t.string :responder_ip, :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :resaults
  end
end
