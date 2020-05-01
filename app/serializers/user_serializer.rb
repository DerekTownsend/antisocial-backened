class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :firstname, :lastname, :email, :password_digest, :admin

  def initialize(user_object, jwt = nil)
    @user = user_object
    @jwt = jwt
  end

    def to_serialized_json
      obj =
      {
        include:{},except: %i[updated_at]
      }
      if @jwt
        {user: @user, jwt: @jwt}.to_json(obj)
      else
        @user.to_json(obj)
      end
    end
end
