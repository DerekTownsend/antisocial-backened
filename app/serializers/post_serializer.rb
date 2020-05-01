class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :message

  def initialize(post_object, total = Post.all.count)
    @post = post_object
    @total = total
  end

  def to_serialized_json
    final_rating = []
    if @post.class == Array
      obj =
      {
        include:{
          user: {only: %i[ username id ]}
        },
        except: %i[user_id]
      }
      # final_rating = @post.collect do |rest|
      #    rest.get_rating()
      #  end

    else

      obj =
      {
         include:
         {
           comments:{
             include:{
             user: {only: %i[ username id ]}
             }}
          }
      }
    end
    {posts: @post, total: @total}.to_json(obj)
  end

end
