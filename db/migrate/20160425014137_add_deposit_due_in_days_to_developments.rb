class AddDepositDueInDaysToDevelopments < ActiveRecord::Migration
  def change
    add_column :developments, :deposit_due_in_days, :integer, default: 0, null: false
  end
end
