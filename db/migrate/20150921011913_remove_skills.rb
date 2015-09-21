class RemoveSkills < ActiveRecord::Migration
  def change
    drop_table :taggings
    drop_table :tags
    drop_table :skills
  end
end
