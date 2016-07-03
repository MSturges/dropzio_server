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

def score
  post = Post.find_by(id: params[:id])



end




  private def posts_params
    params.require(:post).permit(:lat, :long, :imgURL, :title, :content, :score, :follow, :user_id)
  end

end
