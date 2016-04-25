class AddDepositPercentToDevelopments < ActiveRecord::Migration
  def change
    add_column :developments, :deposit_percent, :decimal, default: 0, null: false
  end
end
