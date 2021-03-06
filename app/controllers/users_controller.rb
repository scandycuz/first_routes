class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  # app/controller/users_controller.rb
  def create
    # debugger
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    user = User.find_by(params[:id])
    render json: user
  end

  def update
    user = User.find_by(params[:id])
    user.update!(user_params)
    render json: user
  end

  def destroy
    user = User.find_by(params[:id])
    user.destroy!
    render text: 'User Destroyed'
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
