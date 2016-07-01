class LoginsController < ApplicationController

  # if you get a token error try uncommenting the line below
  # skip_before_filter  :verify_authenticity_token

  def login
    user = User.find_by(userName: params[:user][:userName])
    if user.authenticate(params[:user][:password])
      render :json => {id: user.id, name: user.userName, password: user.password_digest}
    else
      render status: 200, :json => {error: "Name or password is incorrect"}
    end
  end

  

end
