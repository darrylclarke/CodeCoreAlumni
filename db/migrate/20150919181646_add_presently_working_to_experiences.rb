class AddPresentlyWorkingToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :presently_working, :boolean, default: false
  end
end
