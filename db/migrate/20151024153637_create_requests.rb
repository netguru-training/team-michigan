class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :status
      t.string :teachers_note

      t.timestamps null: false
    end
  end
end
