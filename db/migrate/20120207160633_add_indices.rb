class AddIndices < ActiveRecord::Migration
  def change
    add_index :comments, :report_id
    add_index :reports, :date
    add_index :reports, :user_id
    add_index :users, :uid
  end
end
