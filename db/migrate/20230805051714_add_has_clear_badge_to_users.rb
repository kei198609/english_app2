class AddHasClearBadgeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :has_clear_badge, :boolean
  end
end
