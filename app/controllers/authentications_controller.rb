class AuthenticationsController < ApplicationController
  def details 
    authorized
  end

  def login 
    if params[:username].blank?
      return render json: {message: 'Unauthorized, useername is required'}, status: :unauthorized
    end

    if params[:password].blank?
      return render json: {message: 'Unauthorized, password is required'}, status: :unauthorized
    end


    @user = User.find_by(archived: false, username: params[:username])
    
    if @user &&  @user.authenticate(params[:password])
      @user.active = true
      @user.token_id = "#{Random.hex(10).upcase}#{Time.zone.now.to_i}"
      @user.save
      @token = encode_token(
        user_id: @user.token_id
      )
      return  render "authentications/login", formats: [:json]
    else
      return render json: {message: 'Unauthorized, password  or username is incorrect'}, status: :unauthorized
    end
  end
end
