class PostsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:update, :get]

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
    post = Post.in_range(:all, :origin => [user.lat, user.long], :within=> 0.015).order('id')

    if post
      render json: {post: post}
    else
      render json: {post: "No posts within range!"}
    end
  end

  def compass

    params.require(:compass).permit(:lat, :long)

    posts = Post.in_range(:all, :origin => [:lat, :long], :beyond = 0.015, :within=> 0.5).order('id')

    render json: {balls: posts}



    # if posts
    #   render json: {posts: posts}
    # else
    #   render json: {post: "No posts within .5 miles"}
    #
    # end
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
