class AddSuburbIdToDevelopments < ActiveRecord::Migration
  def change
    add_reference :developments, :suburb, foreign_key: true, null: false
    add_index :developments, :suburb_id, unique: false

    remove_column :developments, :suburb
    remove_column :developments, :region
  end

end
