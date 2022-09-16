class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      
      t.string :address
      t.string :post_code
      t.string :name
      t.integer :payment_method
      t.integer :payment_status
      t.integer :payment_price
      t.integer :postage

      t.timestamps
    end
  end
end
