class AddTotalToWorks < ActiveRecord::Migration[7.2]
  def change
    add_column :works, :total, :integer, default: 0, null: false
  end
end
