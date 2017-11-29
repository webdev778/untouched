class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :name, limit: 255, null: false
      t.string :email, limit: 255, null: false
      t.text :body, null: false
      t.boolean :mortgage, default: false, null: false
      t.integer :unit_id, null: false

      t.timestamps null: false
    end
  end
end
