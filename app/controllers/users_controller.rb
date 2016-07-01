class UsersController < ApplicationController

def index
  render json: User.all
end

def show
  user = User.find_by(id: params[:id])
  render :json => {id: user.id, userName: user.userName}

  
end


def create
  user = User.new(user_params)
  if user.save
    render json: user, status: 201
  else
    render json: { errors: user.errors}, status: 422
  end
end

def update
  user = User.find_by(id: params[:id])
  if user.update(params.require(:user).permit(:lat, :long))
    render json: user, status: 201
  else
    render json: { errors: user.errors}, status: 422
  end
end

def destroy
  user = User.find_by(id: params[:id])
  user.destroy
end

# $http.post('/users', {user: userObj} )
# $http.patch('/users', {user: latLng})

private def user_params
  params.require(:user).permit(:userName, :password, :lat, :long)
end

end
