class CreatePlayerStats < ActiveRecord::Migration[7.0]
  def change
    create_table :player_stats do |t|
      t.string :uid
      t.string :name
      t.string :position
      t.string :club
      t.integer :age
      t.integer :wage
      t.integer :height
      t.string :left_foot
      t.string :right_foot
      t.jsonb :stat
      t.timestamps
    end
  end
end
