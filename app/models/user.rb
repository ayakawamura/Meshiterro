class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # PostImageモデルと1対Nの関係　ユーザーを消すと投稿記事も消える
  has_many :post_images,dependent: :destroy
  # PostCommentモデルと1対Nの関係　ユーザーを消すと投稿コメントも消える
  has_many :post_comments,dependent: :destroy
  
  has_many :favorites,dependent: :destroy
  
end
