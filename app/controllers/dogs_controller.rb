class DogsController < ApplicationController
  

  def create
    @dog = Dog.new(dog_params)
    @dog.user_id = current_user.id
    @dog.save
    redirect_to dogs_path
  end

  def index
    @newdog = Dog.new
    @dogs = Dog.all
  end

  def show
    @dog=Dog.find(params[:id])
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dogs_path
  end
  
  private

  def dog_params
    params.require(:dog).permit(:name, :image, :caption)
  end
  
end
