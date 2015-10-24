class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :place
      t.datetime :start_time
      t.datetime :user_deadline
      t.string :name
      t.text :description
      t.integer :slots

      t.timestamps null: false
    end
  end
end
