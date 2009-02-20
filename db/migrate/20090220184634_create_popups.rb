class CreatePopups < ActiveRecord::Migration
  def self.up
    create_table :popups do |t|
      t.string :name
      t.string :file
      t.string :link
      t.integer :width
      t.integer :height
      t.datetime :date_begin
      t.datetime :date_end

      t.timestamps
    end
  end

  def self.down
    drop_table :popups
  end
end
