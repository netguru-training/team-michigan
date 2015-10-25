class AddDefaultStatusToRequest < ActiveRecord::Migration
  def change
    change_column :requests, :status, :string, :default => "pending"
  end
end
