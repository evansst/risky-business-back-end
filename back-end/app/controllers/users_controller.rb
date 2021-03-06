class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users
  end

  def show
    @user = User.find(params[:id])

    render json: @user, include: [:user_matches]
  end

  def create 
    parameters = {
      username: params[:username],
      password: params[:password],
      email: params[:email],
      name: params[:name],
      interests: params[:interests],
      city: params[:city]
    }
    @user = User.create(parameters)
    Match.create(parameters)

    render json: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(
      username: params[:username],
      password: params[:password],
      email: params[:email],
      name: params[:name],
      interests: params[:interests],
      city: params[:city]
    )

    render json: 'Profile has been updated!'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    render json: 'Profile deleted'
  end
end
