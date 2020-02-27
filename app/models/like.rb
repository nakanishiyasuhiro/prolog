class Like < ApplicationRecord
  belongs_to :programminglog
  belongs_to :user
  validates_uniqueness_of :programminglog_id, scope: :user_id
end
