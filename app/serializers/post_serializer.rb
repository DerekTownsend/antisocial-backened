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
          user: {only: %i[ username id ]},
          post_favorites:{except: %i[ created_at updated_at]},
          post_likes:{except: %i[ created_at updated_at]},
          post_dislikes:{except: %i[ created_at updated_at]},
        },
        except: %i[post_id]
      }
      # final_rating = @post.collect do |rest|
      #    rest.get_rating()
      #  end

    else

      obj =
      {
         include:
         {
           user: {only: %i[ username id ]},
           post_favorites:{except: %i[ created_at updated_at]},
           post_likes:{except: %i[ created_at updated_at]},
           post_dislikes:{except: %i[ created_at updated_at]},
           comments:{
             include:{
             user: {only: %i[ username id ]},
             comment_favorites:{except: %i[ created_at updated_at]},
             comment_likes:{except: %i[ created_at updated_at]},
             comment_dislikes:{except: %i[ created_at updated_at]},
             }}
          }
      }
    end
    {posts: @post, total: @total}.to_json(obj)
  end

end
