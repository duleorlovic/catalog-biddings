class CreateCatalogAuctions < ActiveRecord::Migration
  def change
    create_table :catalog_auctions do |t|
      t.references :catalog, index: true, foreign_key: true
      t.float :initial_price
      t.boolean :is_active
      t.datetime :expires_at

      t.timestamps null: false
    end
  end
end
