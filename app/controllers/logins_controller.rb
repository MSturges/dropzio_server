class LoginsController < ApplicationController

  def new

  end

  def create

    user = User.find_by(userName: params[:userName])

    p user

    if user && user.authenticate(params[:password])
      # session[:user_id] = user.id
      render :json => {id: user.id, userName: user.userName}

    else
      render json: { errors: user.errors}, status: 422
    end

  end



  def destroy

    session[:user_id] = nil
    render json => {balls: balls}

  end

end
