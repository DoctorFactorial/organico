class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :seller
      t.text :description
      t.integer :price
      t.boolean :availability, default: true

      t.timestamps null: false
    end
  end
end
