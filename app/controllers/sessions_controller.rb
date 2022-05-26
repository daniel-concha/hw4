class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email" => params["email"]})
    if @user
      if BCrypt::Password.new(@user["password"])== params["password"]
        redirect_to "/places"
      else
        redirect_to "/sessions/new"
      end
    end
  end

  def destroy
  end
end
  