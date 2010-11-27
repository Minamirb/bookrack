class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.string :idsn
      t.string :name
      t.string :author
      t.string :pulisher

      t.timestamps
    end
  end

  def self.down
    drop_table :lists
  end
end
