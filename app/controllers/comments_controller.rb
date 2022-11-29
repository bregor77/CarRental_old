class CommentsController < ApplicationController
  
  http_basic_authenticate_with name: "admin", password: "123456", only: :destroy

  def create
    @car = Car.find(params[:car_id])
    @comment = @car.comments.create(comment_params)
      redirect_to car_path(@car)
  end
  
  def destroy
    @car = Car.find(params[:car_id])
    @comment = @car.comments.find(params[:id])
    @comment.destroy
    redirect_to car_path(@car), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:customer, :body, :status)
    end
end
