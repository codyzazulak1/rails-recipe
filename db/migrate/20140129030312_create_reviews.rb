class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true
      t.references :recipe, index: true
      t.text :text
      t.integer :rating_out_of_ten

      t.timestamps
    end
  end
end
