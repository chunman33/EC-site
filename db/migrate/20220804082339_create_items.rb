class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.timestamps
      t.integer :genre_id
      t.string :name
      t.integer :excluding_tax_price
      t.text :description
      t.boolean :sale_status, default: false
    end
  end
end
