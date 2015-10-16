json.array!(@catalogs) do |catalog|
  json.extract! catalog, :id, :title, :price
  json.url catalog_url(catalog, format: :json)
end
