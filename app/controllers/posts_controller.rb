class PostsController < ApplicationController
  skip_before_action :authorized, only: [:index, :trending, :show, :search]

  def index
    page = params["page"]
    if page
      page = page.to_i
      ending_page = page*24
      starting_page = ending_page-24
      posts = Post.all[starting_page...ending_page]
    else
      posts = Post.all[0...24]
    end
    # total: Post.all.count
    render json:  PostSerializer.new(posts).to_serialized_json
    # posts = Post.all
    # render json: {posts: posts}
  end
  def show
    post = Post.find_by(id: params[:id])

    # total: post.comments.count
    render json:  PostSerializer.new(post,post.comments.count).to_serialized_json
  end

  def trending
    page = params["page"]
    page = page.to_i
    ending_page = page*24
    starting_page = ending_page-24

    posts = Post.all.sort_by{ |post| post.rating}.reverse

    render json: PostSerializer.new(posts).to_serialized_json
  end

  def create
    post = Post.create(post_params)
    render json: PostSerializer.new(post).to_serialized_json
  end

  def update
    post = Post.find_by(id: params[:id])
    post.update_attributes(post_params)
    puts"====================================="
    puts post
    puts"====================================="
    render json: PostSerializer.new(post).to_serialized_json
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    render json: {message: "success"}
  end

  def search
  page = params["page"]
  page = page.to_i
  ending_page = page*24
  starting_page = ending_page-24

  posts = Post.all.select do |post|
    if post.title.downcase.include?(params[:term].downcase)
      post
    end
  end

  if posts
    posts_max = posts.count
    posts = posts[starting_page...ending_page]
    render json:  PostSerializer.new(posts, posts_max).to_serialized_json
  else
    render json: {posts: []}
  end
end
  private
  def post_params
    params.require(:post).permit(:title, :message, :user_id)
  end
end
