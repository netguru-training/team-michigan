class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.float :reading
      t.float :writing
      t.float :listening
      t.integer	:user_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
