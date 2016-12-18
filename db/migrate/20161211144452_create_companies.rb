class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false, limit: 255
      t.integer :kind, default: 0, null: false

      t.timestamps null: false
    end
  end
end
