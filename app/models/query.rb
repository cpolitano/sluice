class Query < ActiveRecord::Base
  belongs_to :user
  has_many :tweets, dependent: :destroy
  validates :keyword, presence: true
  validates :user_id, presence: true
end
