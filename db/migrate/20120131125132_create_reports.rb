class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.date :date
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
