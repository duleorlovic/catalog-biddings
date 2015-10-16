class CatalogAuction < ActiveRecord::Base
  belongs_to :catalog
  has_many :catalog_biddings
end
