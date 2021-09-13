class AddImageToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :image_id, :string
    add_column :customers, :introduction, :string
  end
end
