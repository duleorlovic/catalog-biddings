json.array!(@catalog_auctions) do |catalog_auction|
  json.extract! catalog_auction, :id, :catalog_id, :initial_price, :is_active, :expires_at
  json.url catalog_auction_url(catalog_auction, format: :json)
end
