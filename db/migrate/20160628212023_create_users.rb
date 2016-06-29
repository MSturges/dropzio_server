class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userName
      t.string :password_digest
      t.decimal :lat
      t.decimal :long
    end
  end
end
