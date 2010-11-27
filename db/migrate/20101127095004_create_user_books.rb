class CreateUserBooks < ActiveRecord::Migration
  def self.up
    create_table :user_books do |t|
      t.integer :book_id
      t.string :twitter_id
      t.string :rental_flag

      t.timestamps
    end
  end

  def self.down
    drop_table :user_books
  end
end
