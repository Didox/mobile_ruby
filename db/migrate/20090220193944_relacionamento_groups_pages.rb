class RelacionamentoGroupsPages < ActiveRecord::Migration
  def self.up
     create_table :groups_pages do |t|
       t.column :group_id, :integer
       t.column :page_id, :integer
     end
  end

  def self.down
    drop_table :groups_pages
  end
end
