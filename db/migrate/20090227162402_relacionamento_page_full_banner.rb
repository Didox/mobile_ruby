class RelacionamentoPageFullBanner < ActiveRecord::Migration
  def self.up
     create_table :full_banners_pages do |t|
       t.column :full_banner_id, :integer
       t.column :page_id, :integer
     end
  end

  def self.down
    drop_table :full_banners_pages
  end
end
