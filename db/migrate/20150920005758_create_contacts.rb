class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :email
      t.text :body
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
