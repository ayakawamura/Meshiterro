class PostImage < ApplicationRecord
  
  # Userモデルと1:Nの関係
  belongs_to :user
  
  # refile gemを使うために記入が必要
  attachment :image
end
