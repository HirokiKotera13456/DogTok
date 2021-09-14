class Category < ApplicationRecord
    has_many :dog_category_relations
    has_many :dogs, through: :dog_category_relations
end
