class UsersController < ApplicationController
   before_action :authenticate_user!
   
   def index #list all resources in the UserController
   end
   
   def show
       @user = User.find( params[:id] )
   end
end