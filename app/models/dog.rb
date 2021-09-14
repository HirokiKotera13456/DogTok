class Dog < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :dog_category_relations
  has_many :categories, through: :dog_category_relations
  has_many :dog_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  validates :image, presence: { message: '画像を投稿してください' }
  validates :name, presence: { message: '名前を入力してください' }
  validates :caption, presence:  { message: '説明欄を入力してください' }
  

end
