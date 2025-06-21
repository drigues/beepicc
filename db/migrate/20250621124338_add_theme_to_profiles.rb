class AddThemeToProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :profiles, :theme, :string
  end
end
