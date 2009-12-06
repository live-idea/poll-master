class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :qtype, :default => 'text'
      t.text :body, :variants
      t.boolean :mandatory, :default => false
      t.integer :anketa_id

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
