class User < ActiveRecord::Base
  has_many :articles
  validates_presence_of :uid
  validates_uniqueness_of :uid

end
