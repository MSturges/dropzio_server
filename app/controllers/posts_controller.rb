class PostsController < ApplicationController

  def create
    post = Post.new(posts_params)
    if post.save
      render json: post, status: 201
    else
      render json: { errors: post.errors}, status: 422
    end
  end

  def getposts
    post = Post.all
    render json: {post: post}
  end

  def geoFilteredPosts
    user = User.find_by(id: params[:id])
    post = Post.in_range(:all, :origin => [user.lat, user.long], :within=>1).order('id')
    render json: {post: post}
  end


  def changescore
    post = Post.find_by(id: params[:post][:postId])
    post.score += params[:post][:score]
    post.save
    render json: {post: post}
  end


  private def posts_params
    params.require(:post).permit(:lat, :long, :imgURL, :title, :content, :score, :follow, :user_id )
  end

end



# if post.update(params.require(:post).permit(:score))
#   render json: post, status: 201
# else
#   render json: { errors: post.errors}, status: 422
# end
