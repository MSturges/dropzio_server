class Posts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.decimal :lat
      t.decimal :long
      t.string :imgURL
      t.string :title
      t.string :content
      t.integer :score
      t.boolean :follow, default: false
      t.belongs_to :user
      t.timestamp
    end
  end
end
