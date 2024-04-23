class ApplicationController < ActionController::API
  protected
  def current_user 
    if decoded_token
        token_id = decoded_token[0]['user_id']
        @user = User.find_by(token_id: token_id)
    end
  end 

  def authorized
    unless !!current_user
    render json: {message: 'Unauthorized, kindly login again'}, status: :unauthorized
    end
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets[:secret_key_base])
  end

  def decoded_token
      header = request.headers['Authorization']
      if header
          token = header.split(" ")[1]
          begin
              JWT.decode(token, Rails.application.secrets[:secret_key_base])
          rescue JWT::DecodeError
              nil
          end
      end
  end
end