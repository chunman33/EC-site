class RenameFirstNamColumnToCustomers < ActiveRecord::Migration[6.1]
  def change
    rename_column :customers, :first_nam, :first_name
  end
end
