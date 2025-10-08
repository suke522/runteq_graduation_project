class UpdateWorksTable < ActiveRecord::Migration[7.2]
  def change
    # user_idを外部キーとして扱うように修正
    change_table :works do |t|
      t.remove :user_id, :title, :memo, :status

      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :memo
      t.integer :status, null: false, default: 0
    end
  end
end
