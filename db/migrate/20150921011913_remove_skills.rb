class RemoveSkills < ActiveRecord::Migration
  def change
    drop_table :skills
  end
end
