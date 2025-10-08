class AddDeviseToUsers < ActiveRecord::Migration[7.2]
  def change
    change_column_null :users, :email, false, ""
    change_column_null :users, :encrypted_password, false, ""

    change_table :users do |t|
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
