class CreateDogCategoryRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_category_relations do |t|
      t.integer :dog_id
      t.integer :category_id

      t.timestamps
    end
  end
end
