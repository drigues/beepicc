class AddDirectoryToProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :profiles, :directory, :string
    add_index :profiles, :directory, unique: true
  end
end
