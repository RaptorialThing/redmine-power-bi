class Update < ActiveRecord::Migration[6.1]
  def change
    change_column :reports, :embed_url, :text
    change_column :reports, :id, :int, null: false, unique: true, auto_increment: true 
  end
end