class CreateAnketas < ActiveRecord::Migration
  def self.up
    create_table :anketas do |t|
      t.string :title, :code #створення полей
      t.text :description
      t.integer :poll_id

      t.timestamps
    end
  end

  def self.down
    drop_table :anketas
  end
end
