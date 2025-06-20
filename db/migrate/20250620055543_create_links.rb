class CreateLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :links do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :url
      t.string :link_type
      t.integer :position
      t.integer :click_count

      t.timestamps
    end
  end
end
