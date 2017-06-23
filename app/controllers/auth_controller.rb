class AuthController < ApplicationController

  def create
    if params[:consumer_password] == 'LULU password'
      render json: consumer_auth
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  private

  def consumer_auth
    {
      auth_token: JsonWebToken.encode({consumer_uuid: 'lulu'}),
      consumer: {uuid: 'lulu', lala: 'lala'}
    }
  end


end
