class Like < ApplicationRecord
  belongs_to :user
  belongs_to :programminglog, counter_cache: :likes_count
  validates_uniqueness_of :programminglog_id, scope: :user_id
end
