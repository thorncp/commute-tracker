class CreateCommutes < ActiveRecord::Migration
  def change
    create_table :commutes do |t|
      t.datetime :departed_at
      t.datetime :arrived_at

      t.timestamps null: false
    end
  end
end
