class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :uploads, [:user_id, :created_at]
  end
end
