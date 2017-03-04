class ProfilesController < ApplicationController
    #before_action is a rails action. function is a devise call allowing us to authenticate users
    before_action :authenticate_user!
    before_action :only_current_user
    
    def new
       # form for user can create unique profile
       # params that accesses specific id is how we only show the user their own profile
       @user = User.find( params[:user_id] )
       # established nested action, this allows us to use the build_profile
       @profile = Profile.new
    end
    
    def create
        # reaching into the database - finding current user and storing it in the instance variable
       @user = User.find( params[:user_id] )
       @profile = @user.build_profile(profile_params)
       if @profile.save
           flash[:success] = "Profile Updated!"
           redirect_to user_path( params[:user_id] )
        else
        render action: :new
       end
    end
    
    def edit
        @user = User.find( params[:user_id] ) # load user 
        @profile = @user.profile # load profile
    end
    
    def update
        #establish what user we are targeting
        @user = User.find( params[:user_id] )
        #establish what profile we are updating
        @profile = @user.profile
        if @profile.update_attributes(profile_params)
            flash[:success] = "Profile Updated!"
            redirect_to user_path( params[:user_id] )
        else
            render action: :edit
        end
    end
    
    private
        def profile_params
            params.require(:profile).permit(:first_name, :avatar, :last_name, :job_title, :phone_number, :contact_email, :description)
        end
        
        def only_current_user
            @user = User.find( params[:user_id] )
            redirect_to(root_url) unless @user == current_user
        end
end