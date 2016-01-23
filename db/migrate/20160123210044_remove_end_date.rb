class RemoveEndDate < ActiveRecord::Migration
  def change
  	remove_column :messages, :end_date
  end
end
