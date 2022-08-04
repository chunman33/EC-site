class AddAdminIdToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :admin_id, :integer
  end
end
