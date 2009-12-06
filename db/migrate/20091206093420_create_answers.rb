class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.text :body
      t.integer :question_id, :result_id


      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
