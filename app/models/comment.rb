class Comment < ApplicationRecord
  belongs_to :programminglog
  belongs_to :user  
end
