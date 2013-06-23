class AddProtectedToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :protected, :boolean, :default => true
  end
end
