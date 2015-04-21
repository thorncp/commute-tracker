class AddUserIdToCommutes < ActiveRecord::Migration
  def up
    add_reference :commutes, :user, index: true, foreign_key: true

    Commute.update_all(user_id: User.first.id)

    change_column :commutes, :user_id, :integer, null: false
  end

  def down
    remove_column :commutes, :user_id
  end
end
