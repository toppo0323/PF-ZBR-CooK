class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :customer_id
      t.integer :genre_id
      t.string :name
      t.text :ingredient
      t.text :process
      t.string :image_id

      t.timestamps
    end
  end
end
