class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :user
  has_one :post

  def initialize(comment_object, replies_max=nil)
    @comment = comment_object
    @replies_max = replies_max
  end

    def to_serialized_json

      obj =
      {
        include:
        {
          user:{only: %i[ id username ]},
          comment_favorites:{except: %i[ created_at updated_at]},
          comment_likes:{except: %i[ created_at updated_at]},
          comment_dislikes:{except: %i[ created_at updated_at]},
        },except: %i[ comment_id ]
      }
      if @comment.class != Array
        # puts "+++++|+++++++++++++++++++++++++++++++"
        # puts "here"
        # puts "+++++|+++++++++++++++++++++++++++++++"
        obj =
        {
          include:
          {
            user:{only: %i[ id username ]},
            comment_favorites:{except: %i[ created_at updated_at]},
            comment_likes:{except: %i[ created_at updated_at]},
            comment_dislikes:{except: %i[ created_at updated_at]},
            replies:{
              include:{
                reply_favorites:{except: %i[ created_at updated_at]},
                reply_likes:{except: %i[ created_at updated_at]},
                reply_dislikes:{except: %i[ created_at updated_at]},
                }}
          },except: %i[ comment_id ]
        }
      end

      if @replies_max
        {comments: @comment, total: @replies_max}.to_json(obj)
      else
        @comment.to_json(obj)
      end
    end

end
