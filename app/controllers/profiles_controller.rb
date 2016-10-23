class ProfilesController < ApplicationController
    def new
       # form for user can create unique profile
       @user = User.find( params[:user_id] )
       # established nested action, this allows us to use the build_profile
       @profile = @user.build_profile
       
    end
end