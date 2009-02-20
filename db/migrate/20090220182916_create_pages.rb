class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.string :link
      t.text :obs
      t.integer :position
      t.integer :parent_id
      t.string :color
      t.boolean :title_visibility
      t.boolean :publish
      t.boolean :restricted
      t.boolean :is_menu
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
