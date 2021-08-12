class FavoritesController < ApplicationController
  def create
    dog = Dog.find(params[:dog_id])
    favorite = current_user.favorites.new(dog_id: dog.id)
    favorite.save
    redirect_to dog_path(dog)
  end

  def destroy
    dog = Dog.find(params[:dog_id])
    favorite = current_user.favorites.find_by(dog_id: dog.id)
    favorite.destroy
    redirect_to dog_path(dog)
  end
end
