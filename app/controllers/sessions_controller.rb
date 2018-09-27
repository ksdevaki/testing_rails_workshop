class SessionsController < ApplicationController
    def new
      @user = User.new
    end
    def create
      @user = User.authenticate session_params[:email], session_params[:password]
      if @user.valid?
        login! @user
        redirect_to root_path, notice: "Logged in!"
      else
        render "new"
      end
    end

    def destroy
        logout!
        redirect_to root_url, notice: "Logged out!"
    end

    protected
    def session_params
        params.require(:user).permit(:email, :password)
    end

end
