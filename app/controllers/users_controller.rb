class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    render :json => {id: user.id, userName: user.userName}
  end

  def create
    user = User.new(userName: params[:userName], password_digest: params[:password_digest], lat: params[:lat], long: params[:long])
    # if the user is saved successfully than respond with json data and status code 201
    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors}, status: 422
    end
  end



end
