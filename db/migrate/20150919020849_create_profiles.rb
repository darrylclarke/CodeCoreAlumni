class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :description_long
      t.string :description_short
      t.text :linkedin
      t.text :facebook
      t.text :twitter
      t.text :personal_url

      t.timestamps null: false
    end
  end
end
