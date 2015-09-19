class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :degree
      t.string :institution
      t.string :desc
      t.string :year
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
