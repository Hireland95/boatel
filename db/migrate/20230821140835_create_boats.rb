class CreateBoats < ActiveRecord::Migration[7.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :image_url
      t.string :address
      t.string :type
      t.text :details
      t.float :price

      t.timestamps
    end
  end
end
