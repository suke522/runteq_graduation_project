class CreateWorks < ActiveRecord::Migration[7.2]
  def change
    create_table :works do |t|
      t.integer :user_id
      t.string :title
      t.text :memo
      t.integer :status

      t.timestamps
    end
  end
end
