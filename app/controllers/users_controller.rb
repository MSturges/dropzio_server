class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    render :json => {id: user.id, userName: user.userName}
  end

end
