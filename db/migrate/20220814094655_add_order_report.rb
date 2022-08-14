class AddOrderReport < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :workspace_order_id, :int 
    add_column :reports, :report_order_id, :int
  end
end
