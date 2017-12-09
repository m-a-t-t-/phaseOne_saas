class UsersController < ApplicationController
   before_action :authenticate_user!
   
   def index #list all resources in the UserController
      @users = User.all #array object storing all users
   end
   
   def show
       @user = User.find( params[:id] )
   end
end