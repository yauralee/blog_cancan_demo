class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true,
            length: { minimum: 5 }
  validates_presence_of :user_id

end
