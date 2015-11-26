Lotus::Model.migration do
  change do
    create_table "users" do |t|
      primary_key :id

      column :email, String, null: false
      column :encrypted_password, String, null: false, size: 128
      column :confirmation_token, String, size: 128
      column :remember_token, String, size: 128
      column :timezone, String, null: false, default: "US/Pacific"

      column :created_at, Time, null: false
      column :updated_at, Time, null: false

      index :email, name: "index_users_on_email"
      index :remember_token, name: "index_users_on_remember_token"
    end

    create_table :commutes do
      primary_key :id
      foreign_key :user_id, :users, on_delete: :cascade, null: false

      column :departed_at, Time
      column :arrived_at, Time

      column :created_at, Time, null: false
      column :updated_at, Time, null: false

      index :user_id, name: "index_commutes_on_user_id"
    end
  end
end
