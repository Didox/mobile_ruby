class CreateFullBanners < ActiveRecord::Migration
  def self.up
    create_table :full_banners do |t|
      t.string :name
      t.string :file
      t.string :link
      t.datetime :date_begin
      t.datetime :date_end

      t.timestamps
    end
  end

  def self.down
    drop_table :full_banners
  end
end
