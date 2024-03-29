class AddUniqueIndexForUidToPlayerStats < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_index :player_stats, :uid, unique: true, algorithm: :concurrently
  end
end
