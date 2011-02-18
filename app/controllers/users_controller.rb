class UsersController < ApplicationController
  def new
    @title = 'SignUp'
  end
  
  def show
    # params[:id] passed down from route 'GET users/1'
    @user = User.find(params[:id])
  end

end
