class CatalogBidding < ActiveRecord::Base
  belongs_to :catalog_auction
  belongs_to :user
  before_validation :need_to_be_greater
  before_validation :auction_should_not_be_expired
  validates_presence_of :user, :offered_price

  default_scope { order offered_at: :desc }

  def need_to_be_greater
    max = catalog_auction.catalog_biddings.map(&:offered_price).max
    if max.to_i >= offered_price.to_i
      errors.add(:offered_price, "should be greater than #{max}")
    end
  end

  def auction_should_not_be_expired
    if catalog_auction.expires_at < Time.now
      errors.add(:offered_price, "is not valid. Auction expired")
    end
  end
end
