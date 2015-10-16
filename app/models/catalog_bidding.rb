class CatalogBidding < ActiveRecord::Base
  belongs_to :catalog_auction
  belongs_to :user
end
