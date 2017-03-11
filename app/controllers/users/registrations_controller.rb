class Users::RegistrationsController < Devise::RegistrationsController
    before_filter :select_plan, only: :new
    
    def create
        super do |resource| #importing create action code established by devise adding to the devise code with if/else statement
            if params[:plan] #check params
                resource.plan_id = params[:plan] #save param to id in db to establish which plan they are coming from
                if resource.plan_id == 2 #if user id == 2 then run method below
                    resource.save_with_payment #method is defined in model file
                else
                    resource.save
                end
            end
        end
    end
    private
    def select_plan
        unless params[:plan] && (params[:plan] == '1' || params[:plan] == '2')
          flash[:notice] = "Please select a membership plan to sign up."
          redirect_to root_url
        end
    end
end