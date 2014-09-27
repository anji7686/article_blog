class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.date :birthday
      t.integer :mobile
      t.string :location

      t.timestamps
    end
  end
end
