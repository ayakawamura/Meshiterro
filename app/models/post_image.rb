class PostImage < ApplicationRecord
  
  # Userモデルと1:Nの関係
  belongs_to :user
  
  # refile gemを使うために記入が必要
  attachment :image
  
  # PostImageモデルと1:N 投稿記事が消えると投稿コメントも消える
  has_many :post_comments,dependent: :destroy
  
  has_many :favorites,dependent: :destroy
  
  validates :shop_name, presence: true
  validates :image, presence: true
  
  # ユーザーIDがFavoriteテーブル内に存在するか確認
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  
end
