class CreateResponders < ActiveRecord::Migration
  def self.up
    create_table :responders do |t|
      t.string :first_name, :last_name, :father_name, :email, :sex, :city, :address, :aducation, :phone
      t.date :birthday

      t.timestamps
    end
  end

  def self.down
    drop_table :responders
  end
end
