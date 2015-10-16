json.array!(@catalog_biddings) do |catalog_bidding|
  json.extract! catalog_bidding, :id, :catalog_auction_id, :user_id, :offered_price, :offered_at
  json.url catalog_bidding_url(catalog_bidding, format: :json)
end
