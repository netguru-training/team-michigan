class AddEventIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :event_id, :integer
  end
end
