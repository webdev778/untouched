class AddCompanyAndNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company_id, :integer, null: false
    add_column :users, :name, :string, null: false, limit: 255
  end
end
