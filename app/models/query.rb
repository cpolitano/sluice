class Query < ActiveRecord::Base
  belongs_to :user
  validates :keyword, presence: true
end
