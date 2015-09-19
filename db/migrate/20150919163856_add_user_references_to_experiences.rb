class AddUserReferencesToExperiences < ActiveRecord::Migration
  def change
    add_reference :experiences, :user, index: true, foreign_key: true
  end
end
