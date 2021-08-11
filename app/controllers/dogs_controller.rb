class DogsController < ApplicationController


  def create
    @dogs = Dog.all
    @newdog = Dog.new(dog_params)
    @newdog.user_id = current_user.id
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

    @user = current_user
  end

  def show
    @dog=Dog.find(params[:id])
    @user = @dog.user
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
