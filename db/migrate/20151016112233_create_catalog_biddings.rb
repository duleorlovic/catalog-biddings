class CreateCatalogBiddings < ActiveRecord::Migration
  def change
    create_table :catalog_biddings do |t|
      t.references :catalog_auction, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.float :offered_price
      t.datetime :offered_at

      t.timestamps null: false
    end
  end
end
