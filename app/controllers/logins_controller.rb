class LoginsController < ApplicationController

  include BCrypt
  skip_before_filter  :verify_authenticity_token

  def signin

    user = User.find_by(userName: params[:user][:userName])
    @password ||= Password.new(password_hash)
    # puts user.password == params[:user][:password]
    puts @password
    puts params[:user][:password]

    if @password == params[:user][:password]
      puts user
      render :json => {id: user.id, name: user.userName}
    else
      render status: 400, :json => {error: "Name or password is incorrect"}
    end
  end

end


# def signin
#   user = User.find_by(name: params[:name])
#   if user.password == params[:password]
#     jwt = JsonWebToken.sign({id: user.id}, key: ENV['SECRET'])
#     render :json => {id: user.id, name: user.name, jwt: jwt}
#   else
#     render status: 400, :json => {error: "Name or password is incorrect"}
#   end
# end
