class DogCommentsController < ApplicationController
  
  def create
    @dog = Dog.find(params[:dog_id])
    @comment = current_user.dog_comments.new(dog_comment_params)
    @comment.dog_id = @dog.id
    @comment.save
    redirect_to dog_path(@dog)  
  end
  
  
  def destroy
    DogComment.find_by(id: params[:id], dog_id: params[:dog_id]).destroy
    redirect_to dog_path(params[:dog_id])
  end
  
  private

  def dog_comment_params
    params.require(:dog_comment).permit(:comment)
  end
  
end
