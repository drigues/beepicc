class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :bio
      t.string :avatar_url
      t.string :color_theme
      t.jsonb :social_links

      t.timestamps
    end
  end
end
