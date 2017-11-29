class AddIntercomAppIdAndAPIKeyToDevelopments < ActiveRecord::Migration
  def change
    add_column :developments, :intercom_app_id, :string, limit: 255, null: true
  end
end
