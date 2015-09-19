class AddForHireBooleanToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :for_hire, :boolean
  end
end
