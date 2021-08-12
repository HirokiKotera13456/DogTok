class Dog < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :dog_comments, dependent: :destroy
  
  validates :name, presence: { message: '名前を入力してください' }
  validates :caption, presence:  { message: '説明欄を入力してください' }
end
