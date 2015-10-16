class User < ActiveRecord::Base
  include Clearance::User
  has_many :catalog_biddings
end
