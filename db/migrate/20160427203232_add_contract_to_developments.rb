class AddContractToDevelopments < ActiveRecord::Migration
  def change
    add_column :developments, :contract, :string, limit: 255, null: true
  end
end
