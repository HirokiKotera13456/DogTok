class DogsController < ApplicationController


  def create
    @dogs = Dog.all
    @newdog = Dog.new(dog_params)
   if @newdog.save
     redirect_to dogs_path
   else
      @user = current_user
      render :index
   end
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
