class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  # paginates_per 5 # Only need this and the one below if I change the default settings
  # max_paginates_per 5
end
