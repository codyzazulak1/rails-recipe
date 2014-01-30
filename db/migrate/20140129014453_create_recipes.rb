class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :cook_time
      t.text :ingredients
      t.text :directions
      t.string :poster_image_url

      t.timestamps
    end
  end
end
