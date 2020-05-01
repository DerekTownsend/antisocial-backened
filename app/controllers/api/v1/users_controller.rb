class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :show]

  def profile
    user = current_user
    render json: UserSerializer.new(user).to_serialized_json, status: :accepted
  end

  def show
    user = User.find_by(id: params[:id])
    render json:  UserSerializer.new(user,user.posts.count).to_serialized_json
  end

  def create
    # user = User.new(user_params)
    # puts user
    user = User.create(user_params)

    if user.valid?
      token = encode_token(user_id: user.id)
      render json: UserSerializer.new(user, token).to_serialized_json, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def favorite_posts
    page = params["page"]
    page = page.to_i
    ending_page = page*24
    starting_page = ending_page-24

    user = current_user

    posts_max = user.favorited_posts.count
    posts = user.favorited_posts[starting_page...ending_page]

    render json:  PostSerializer.new(posts, posts_max).to_serialized_json
  end

  def posts
    page = params["page"]
    page = page.to_i
    ending_page = page*24
    starting_page = ending_page-24

    user = current_user

    posts_max = user.posts.count
    posts = user.posts[starting_page...ending_page]

    render json:  PostSerializer.new(posts, posts_max).to_serialized_json
  end

  def likes
    page = params["page"]
    page = page.to_i
    ending_page = page*24
    starting_page = ending_page-24

    user = current_user
    posts_max = user.liked_posts.count
    posts = user.liked_posts[starting_page...ending_page]

    render json:  PostSerializer.new(posts, posts_max).to_serialized_json
  end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :admin)
  end

end
