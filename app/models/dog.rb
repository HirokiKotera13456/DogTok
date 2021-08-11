class Dog < ApplicationRecord
  belongs_to :user
  attachment :image
  
  validates :name, presence: true
  validates :caption, presence: true
end
