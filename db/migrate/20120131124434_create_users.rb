class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :name
      t.string :icon
      t.string :uid
      t.string :token

      t.timestamps
    end
  end
end
