class CatalogBidding < ActiveRecord::Base
  belongs_to :catalog_auction
  belongs_to :user
  before_validation :need_to_be_greater
  validates_presence_of :user, :offered_price

  default_scope { order offered_at: :desc }
  def need_to_be_greater
    max = catalog_auction.catalog_biddings.map(&:offered_price).max
    if max.to_i >= offered_price.to_i
      errors.add(:offered_price, "should be greater than #{max}")
    end
  end
end
