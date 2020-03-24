class Comment < ApplicationRecord
  belongs_to :programminglog, optional: true
  belongs_to :user  
end
