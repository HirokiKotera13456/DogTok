class DogCategoryRelation < ApplicationRecord
    belongs_to :dog
    belongs_to :category
end
