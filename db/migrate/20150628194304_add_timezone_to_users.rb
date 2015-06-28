class AddTimezoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :timezone, :string, null: false, default: "US/Pacific"
  end
end
