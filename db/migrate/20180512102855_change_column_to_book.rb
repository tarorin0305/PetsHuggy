class ChangeColumnToBook < ActiveRecord::Migration
  def change
    remove_foreign_key "listings", "users"
    remove_foreign_key "photos", "listings"
  end
end
