class ChangeColumnToBook3 < ActiveRecord::Migration
  def change
    add_foreign_key "listings", "users"
    add_foreign_key "photos", "listings"
  end
end
