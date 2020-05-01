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
          user_favorites:{only: %i[ id ]},
          user_likes:{only: %i[ id ]},
          user_dislikes:{only: %i[ id ]},
        },except: %i[ user_id ]
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
            user_favorites:{only: %i[ id ]},
            user_likes:{only: %i[ id ]},
            user_dislikes:{only: %i[ id ]},
            replies:{
              include:{
                user_favorites:{only: %i[ id ]},
                user_likes:{only: %i[ id ]},
                user_dislikes:{only: %i[ id ]},
                }}
          },except: %i[ user_id ]
        }
      end

      if @replies_max
        {comments: @comment, total: @replies_max}.to_json(obj)
      else
        @comment.to_json(obj)
      end
    end

end
