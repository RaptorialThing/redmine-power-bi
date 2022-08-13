class CreateUserReports < ActiveRecord::Migration[6.1]
  def change
    create_table :user_reports do |t|
      t.belongs_to :report 
      t.belongs_to :user
    end
  end
end
