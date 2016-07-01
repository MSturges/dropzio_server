class LoginsController < ApplicationController

  def login
    user = User.find_by(userName: params[:user][:userName])

    if !user || user.authenticate(params[:user][:password])
      render json: user, status: 201
    else
      render status: 200, :json => {error: "Name or password is incorrect"}
    end
  end
end
