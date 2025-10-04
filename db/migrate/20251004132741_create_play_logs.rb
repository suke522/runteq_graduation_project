class CreatePlayLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :play_logs do |t|
      t.integer :user_id
      t.integer :work_id
      t.integer :time_spent
      t.datetime :logged_at

      t.timestamps
    end
  end
end
