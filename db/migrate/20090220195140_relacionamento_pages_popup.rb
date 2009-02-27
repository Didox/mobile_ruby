class RelacionamentoPagesPopup < ActiveRecord::Migration
 def self.up
     create_table :pages_popups do |t|
       t.column :popup_id, :integer
       t.column :page_id, :integer
     end
  end

  def self.down
    drop_table :pages_popups
  end
end
