class ProfilesController < ApplicationController
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
            params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
        end
end