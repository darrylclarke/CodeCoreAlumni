class ChangeColumnName < ActiveRecord::Migration
  def up
    add_column :profiles, :github, :text
  end

  def down
    remove_column :profiles, :facebook
  end
end
