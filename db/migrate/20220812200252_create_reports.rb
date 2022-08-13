class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :power_bi_id
      t.string :power_bi_name
      t.string :embed_url
    end
  end
end
