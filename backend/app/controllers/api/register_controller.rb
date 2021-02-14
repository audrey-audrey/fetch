class Api::RegisterController < ApplicationController

  def create
    user = User.new(
      name: params["name"], 
      email: params["email"], 
      password: params["password"]
    )
    render json: user
  end
end
